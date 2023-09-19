import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  String currentLocale = "en";
  ThemeMode currentMode = ThemeMode.light;


  bool isDarkMode ()=> currentMode == ThemeMode.dark;
  bool isArEnabled ()=> currentLocale == "ar";
  void setMode(ThemeMode newMode){
   currentMode = newMode;
   notifyListeners();
  }

  void setCurrentLocale(String newLocale){
    currentLocale = newLocale;
    notifyListeners();
  }
}