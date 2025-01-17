import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../providers/app_provider.dart';
import '../../providers/user_provider.dart';
import '../../utils/base_extensions.dart';
import '../../utils/enums.dart';
import '../../utils/my_theme.dart';
import '../../utils/shared_pref.dart';
import '../network/my_fields.dart';
import '../widgets/custom_back_button.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({
    super.key,
  });

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late AppProvider _appProvider;
  late UserProvider _userProvider;
  late String? _selectedLanguage;

  Widget _checkIcon(BuildContext context) => FaIcon(
        FontAwesomeIcons.check,
        color: context.colorScheme.onPrimary,
      );

  void _submit(BuildContext context, String langCode) {
    setState(() {
      _selectedLanguage = langCode;
    });
    _appProvider.setLanguage(context, languageCode: _selectedLanguage!);
    _updateUserLanguage();
  }

  void _updateUserLanguage() {
    _userProvider.userDocRef.update({
      MyFields.languageCode: _selectedLanguage,
    });
  }

  @override
  void initState() {
    super.initState();
    _appProvider = context.appProvider;
    _userProvider = context.userProvider;
    _selectedLanguage = MySharedPreferences.language;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomBackButton(),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          listTileTheme: ListTileThemeData(
            tileColor: context.colorPalette.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(MyTheme.radiusPrimary),
            ),
            titleTextStyle: context.textTheme.bodyLarge!.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: FaIcon(
                    FontAwesomeIcons.language,
                    size: 60,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                  child: Center(
                    child: ListBody(
                      children: [
                        Text(
                          "Select your favorite langauge",
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleLarge,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "إختر اللغة المفضلة لديك",
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                ZoomIn(
                  child: ListTile(
                    onTap: () {
                      _submit(context, LanguageEnum.english);
                    },
                    title: const Text("English"),
                    trailing: _selectedLanguage == LanguageEnum.english ? _checkIcon(context) : const SizedBox.shrink(),
                  ),
                ),
                const SizedBox(height: 10),
                ZoomIn(
                  delay: const Duration(milliseconds: 300),
                  child: ListTile(
                    onTap: () {
                      _submit(context, LanguageEnum.arabic);
                    },
                    title: const Text("العربية"),
                    trailing: _selectedLanguage == LanguageEnum.arabic ? _checkIcon(context) : const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
