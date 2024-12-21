import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:local_auth/local_auth.dart';
import 'package:visionary_journey_app/helper/ui_helper.dart';
import 'package:visionary_journey_app/screens/home/home_screen.dart';
import 'package:visionary_journey_app/utils/app_constants.dart';

import '../alerts/feedback/app_feedback.dart';
import '../alerts/loading/app_over_loader.dart';
import '../models/otp_model.dart';
import '../models/user/user_model.dart';
import '../network/api_service.dart';
import '../network/fire_queries.dart';
import '../network/my_collections.dart';
import '../network/my_fields.dart';
import '../screens/login/verify_code_screen.dart';
import '../utils/base_extensions.dart';
import '../utils/shared_pref.dart';

class UserProvider extends ChangeNotifier {
  Function()? onGuestRegistration;

  User? get user => _firebaseAuth.currentUser;
  String? get userUid => user?.uid;
  bool get isAuthenticated => user != null;
  // bool get isAuthenticated => MySharedPreferences.user != null;

  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;

  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;

  DocumentReference<UserModel> get userDocRef => _firebaseFirestore.users.doc(userUid);

  CollectionReference<Map<String, dynamic>> get addressesCollectionRef => userDocRef.collection(MyCollections.addresses);

  // CollectionReference<Map<String, dynamic>> get ordersCollectionRef => userDocRef.collection(MyCollections.orders);

  Stream<DocumentSnapshot<UserModel>> get userStream => userDocRef.snapshots();

  Future<void> sendPinCode(
    BuildContext context, {
    required String countryCode,
    required String phoneNum,
  }) async {
    ApiService.fetch(
      context,
      callBack: () async {
        debugPrint("PhoneNumber:: ${context.getDialCode(countryCode)}$phoneNum");
        late http.Response response;
        if (kDebugMode) {
          await Future.delayed(const Duration(seconds: 1));
          response = http.Response(jsonEncode(OtpModel().toJson()), 200);
        } else {
          response = await http.post(
            Uri.parse('https://api.doverifyit.com/api/otp-send/$kOtpId'),
            headers: {
              'Content-Type': 'application/json',
              "Authorization": kOtpToken,
            },
            body: jsonEncode({
              "contact": "${context.getDialCode(countryCode)}$phoneNum",
            }),
          );
        }
        final body = OtpModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        if (response.statusCode == 200 && context.mounted) {
          context.navigate((context) {
            return VerifyCodeScreen(
              countryCode: countryCode,
              phoneNum: phoneNum,
            );
          });
        } else if (context.mounted) {
          context.showSnackBar(body.message ?? context.appLocalization.generalError);
        }
      },
    );
  }

  Future<void> login(
    BuildContext context, {
    required String code,
    required String phoneNum,
  }) async {
    final email = UiHelper.getEmail(code, phoneNum);
    try {
      debugPrint("Email:: $email");
      AppOverlayLoader.show();
      final auth = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: UiHelper.getPassword,
      );
      if (context.mounted) {
        await register(context, auth, phoneNumber: phoneNum);
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        if (e.code == 'user-not-found' || e.code == "invalid-credential") {
          final auth = await _firebaseAuth.createUserWithEmailAndPassword(
            email: email,
            password: UiHelper.getPassword,
          );
          if (context.mounted) {
            await register(context, auth, phoneNumber: phoneNum);
          }
          // context.showSnackBar(context.appLocalization.emailNotFount);
        } else if (e.code == 'wrong-password') {
          context.showSnackBar(context.appLocalization.wrongPassword);
        } else {
          context.showSnackBar(context.appLocalization.emailNotFount);
        }
      }
    } catch (e) {
      if (context.mounted) {
        print("eeeee::: $e");
        context.showSnackBar(context.appLocalization.generalError);
      }
    } finally {
      AppOverlayLoader.hide();
    }
  }

  Future<void> register(
    BuildContext context,
    UserCredential auth, {
    required String phoneNumber,
  }) async {
    await ApiService.fetch(
      context,
      callBack: () async {
        final user = UserModel();
        user.id = auth.user?.uid;
        MySharedPreferences.fingerPrintId = user.id!;
        user.email = auth.user?.email;
        user.phoneCountryCode = kFallBackCountryCode;
        user.phone = phoneNumber;
        user.deviceToken = await _getDeviceToken();
        user.languageCode = MySharedPreferences.language;
        final userDocument = await _firebaseFirestore.users.doc(user.id).get();
        if (!userDocument.exists) {
          MySharedPreferences.user = user;
          final json = {
            ...user.toJson(),
            ...{
              MyFields.createdAt: FieldValue.serverTimestamp(),
            },
          };
          await FirebaseFirestore.instance.collection(MyCollections.users).doc(user.id).set(json);
        } else {
          MySharedPreferences.user = userDocument.data()!;
          if (context.mounted && userDocument.data()!.blocked) {
            context.showSnackBar(context.appLocalization.authFailed);
            return;
          }
        }

        notifyListeners();

        if (context.mounted) {
          updateDeviceToken(context);
          handleUserNavigation(context);
        }
      },
    );
  }

  void handleUserNavigation(BuildContext context) {
    if (onGuestRegistration != null) {
      onGuestRegistration!();
      onGuestRegistration = null;
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        }),
        (route) => false,
      );
      // DiscoverRoute().go(context);
    }
  }

  Future<String?> _getDeviceToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  void onGuestRoute(Function() callBack) {
    onGuestRegistration = callBack;
  }

  Future<void> updateDeviceToken(BuildContext context) async {
    try {
      final deviceToken = await _getDeviceToken();
      debugPrint("DeviceToken:: $deviceToken");
      if (context.mounted && isAuthenticated) {
        userDocRef.update({
          MyFields.deviceToken: deviceToken,
        });
      }
    } catch (e) {
      debugPrint("DeviceTokenError:: $e");
    }
  }

  Future<void> logout(BuildContext context) async {
    await _firebaseAuth.signOut();
    MySharedPreferences.clearStorage();
    notifyListeners();
    if (context.mounted) {
      // RegistrationRoute().go(context);
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    ApiService.fetch(
      context,
      callBack: () async {
        await user?.delete();
        if (context.mounted) {
          logout(context);
          context.showSnackBar(context.appLocalization.deleteAccountSuccess);
        }
      },
      onError: (failure) {
        if (failure.code == "requires-recent-login") {
          context.showSnackBar(context.appLocalization.requireRecentLogin);
        } else {
          context.showSnackBar(context.appLocalization.generalError);
        }
      },
    );
  }

  Future<void> getFingerPrint(BuildContext context) async {
    ApiService.fetch(
      context,
      withOverlayLoader: false,
      callBack: () async {
        final auth = LocalAuthentication();
        final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
        final bool canAuthenticate = canAuthenticateWithBiometrics || await auth.isDeviceSupported();
        if (canAuthenticate) {
          try {
            final bool didAuthenticate = await auth.authenticate(
              localizedReason: 'Please authenticate to access your account',
            );
            if (didAuthenticate) {
              print("aklsfjaslkjfjklasfkjlsa ${MySharedPreferences.fingerPrintId}");
              final userDoc = await _firebaseFirestore.users.doc(MySharedPreferences.fingerPrintId).get();
              print("doc::: $userDoc");
              if (context.mounted) {
                login(
                  context,
                  code: userDoc.data()!.phoneCountryCode!,
                  phoneNum: userDoc.data()!.phone!,
                );
              }
            }
          } catch (e) {
            if (context.mounted) {
              context.showSnackBar(context.appLocalization.generalError);
            }
          }
        } else if (context.mounted) {
          context.showSnackBar(context.appLocalization.fingerPrintError);
        }
      },
    );
  }
}
