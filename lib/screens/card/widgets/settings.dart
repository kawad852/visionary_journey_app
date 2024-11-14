import 'package:flutter/material.dart';
import 'package:visionary_journey_app/screens/card/widgets/settings_card.dart';
import 'package:visionary_journey_app/screens/card/widgets/settings_text.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isMale = true;
  double textSize = 0.2;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "App Settings",
              style: TextStyle(
                color: context.colorPalette.black1D,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 9),
            SettingsCard(
              child: Row(
                children: [
                  const Expanded(
                    child: SettingsText(
                      "visual impairment (driver notification).",
                    ),
                  ),
                  Switch(
                    value: true,
                    activeTrackColor: context.colorPalette.black1D,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            SettingsCard(
              child: Row(
                children: [
                  const Expanded(
                    child: SettingsText("Activate sound notifications"),
                  ),
                  Switch(
                    value: true,
                    activeTrackColor: context.colorPalette.black1D,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Expanded(
                  child: SettingsCard(
                    child: SettingsText("Select voice option"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isMale = true;
                    });
                  },
                  child: Container(
                    width: 90,
                    height: 48,
                    margin:
                        const EdgeInsets.only(bottom: 12, left: 5, right: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: _isMale
                          ? context.colorPalette.black1D
                          : context.colorPalette.white,
                      borderRadius:
                          BorderRadius.circular(MyTheme.radiusTertiary),
                    ),
                    child: Text(
                      "Male",
                      style: TextStyle(
                        color: _isMale
                            ? context.colorPalette.white
                            : context.colorPalette.black1D,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isMale = false;
                    });
                  },
                  child: Container(
                    width: 90,
                    height: 48,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: !_isMale
                          ? context.colorPalette.black1D
                          : context.colorPalette.white,
                      borderRadius:
                          BorderRadius.circular(MyTheme.radiusTertiary),
                    ),
                    child: Text(
                      "Female",
                      style: TextStyle(
                        color: !_isMale
                            ? context.colorPalette.white
                            : context.colorPalette.black1D,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SettingsCard(
              child: Row(
                children: [
                  const Expanded(
                    child: SettingsText("Enable location access"),
                  ),
                  Switch(
                    value: true,
                    activeTrackColor: context.colorPalette.black1D,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            SettingsCard(
              child: Row(
                children: [
                  Text(
                    "Aa",
                    style: TextStyle(
                      color: context.colorPalette.black1D,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      value: textSize,
                      activeColor: context.colorPalette.black1D,
                      inactiveColor: context.colorPalette.grey66,
                      onChanged: (value) {
                        setState(() {
                          textSize = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    "Aa",
                    style: TextStyle(
                      color: context.colorPalette.black1D,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SettingsCard(
              onTap: () {},
              child: const Align(
                alignment: AlignmentDirectional.centerStart,
                child: SettingsText("Adjust the viewing angle"),
              ),
            ),
            SettingsCard(
              onTap: () {},
              child: const Align(
                alignment: AlignmentDirectional.centerStart,
                child: SettingsText("Change language"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
