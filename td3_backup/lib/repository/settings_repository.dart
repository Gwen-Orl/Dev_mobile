import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';

class SettingRepository{
  static const THEME_KEY = "darkMode";
  saveSettings(bool value) async {
    SharedPreferences sharedPreferences = await
    SharedPreferences.getInstance();
    sharedPreferences.setBool(THEME_KEY, value);
  }
  Future<bool> getSettings() async {
    SharedPreferences sharedPreferences = await
    SharedPreferences.getInstance();
    return sharedPreferences.getBool(THEME_KEY) ?? false;
  }
}