import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../alerts/feedback/app_feedback.dart';
import '../models/user/user_model.dart';
import '../network/api_service.dart';
import '../network/fire_queries.dart';
import '../network/my_collections.dart';
import '../network/my_fields.dart';
import '../utils/base_extensions.dart';
import '../utils/shared_pref.dart';

class UserProvider extends ChangeNotifier {
  Function()? onGuestRegistration;

  User? get user => _firebaseAuth.currentUser;
  String? get userUid => user?.uid;
  bool get isAuthenticated => user != null && !user!.isAnonymous && user!.emailVerified;

  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;

  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;

  DocumentReference<UserModel> get userDocRef => _firebaseFirestore.users.doc(userUid);

  CollectionReference<Map<String, dynamic>> get addressesCollectionRef => userDocRef.collection(MyCollections.addresses);

  // CollectionReference<Map<String, dynamic>> get ordersCollectionRef => userDocRef.collection(MyCollections.orders);

  Stream<DocumentSnapshot<UserModel>> get userStream => userDocRef.snapshots();

  Future<void> register(
    BuildContext context,
    UserCredential auth, {
    required String provider,
    required String? guestRoute,
    String? phoneCountryCode,
    String? displayName,
  }) async {
    await ApiService.fetch(
      context,
      callBack: () async {
        final user = UserModel();
        user.provider = provider;
        user.id = auth.user?.uid;
        user.email = auth.user?.email;
        user.phoneCountryCode = phoneCountryCode;
        user.phone = auth.user?.phoneNumber;
        user.displayName = displayName ?? auth.user?.displayName;
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
}
