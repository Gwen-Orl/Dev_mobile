import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:projet2/UI/mytheme.dart';
import '../viewmodel/setting_view_model.dart';

class EcranSetting extends StatefulWidget{
  @override
  State<EcranSetting> createState() => _EcranSettingsState();
}
class _EcranSettingsState extends State<EcranSetting> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SettingsList(
            darkTheme: SettingsThemeData(
                settingsListBackground:
                MyTheme.dark().scaffoldBackgroundColor,
                settingsSectionBackground:
                MyTheme.dark().scaffoldBackgroundColor
            ),
            lightTheme: SettingsThemeData(
                settingsListBackground:
                MyTheme.light().scaffoldBackgroundColor,
                settingsSectionBackground:
                MyTheme.light().scaffoldBackgroundColor
            ),
            sections: [
        SettingsSection(
        title: const Text('Theme'),
        tiles: [
        SettingsTile.switchTile(initialValue: context.watch<SettingViewModel>().isDark, //Provider.of<SettingViewModel>(context).isDark,
                                onToggle: (bool value){context.read<SettingViewModel>().isDark=value;},//Provider.of<SettingViewModel>
                                title: const Text('Dark mode'),
                                leading: const Icon(Icons.invert_colors),)
        ])
      ],
    ),
  );
}
}
