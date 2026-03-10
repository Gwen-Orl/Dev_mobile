import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:projet2/UI/mytheme.dart';

class EcranSetting extends StatefulWidget{
  @override
  State<EcranSetting> createState() => _EcranSettingState();
}
class _EcranSettingState extends State<EcranSetting> {
  bool _dark =true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SettingsList(
        darkTheme: SettingsThemeData(
            settingsListBackground: MyTheme.dark().scaffoldBackgroundColor,
            settingsSectionBackground:
            MyTheme.dark().scaffoldBackgroundColor
        ),
        lightTheme: SettingsThemeData(
            settingsListBackground: MyTheme.light().scaffoldBackgroundColor,
            settingsSectionBackground:
            MyTheme.light().scaffoldBackgroundColor
        ),
        sections: [
          SettingsSection(
              title: const Text('Theme'),
              tiles: [
                SettingsTile.switchTile(
                  initialValue: _dark,
                  onToggle: _onToggle,
                  title: const Text('Dark mode'),
                  leading: const Icon(Icons.invert_colors),)
              ])
        ],
      ),
    );
  }
  _onToggle(bool value) {
    debugPrint('value $value');
    setState(() {
      _dark = !_dark;
    });
  }
}