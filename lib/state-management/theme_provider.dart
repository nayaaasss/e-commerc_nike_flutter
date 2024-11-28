import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//inisal state 

class ThemeProvider extends ChangeNotifier { //konsep OOP --> inheritance, parent rajanya
  bool _isDarkTheme = false; //boiler plate, setter (nge set), variable

  ThemeProvider(){
    _loadTheme(); //mmebuat load theme saat aplikasi pertama kali dibuka, akan di jalankn oleh ThemeProvider
  }

  //TODO - PR untuk anak-anak tercinta untuk mengingat, ini itu sebenarnya apasih?
  bool get isDarkTheme => _isDarkTheme; //getter (untuk ngambil), harus sama dengan variable diatas bool _isDarkTheme = false;

  void toggleTheme(bool isDark) async { //set perubahan pertama
    SharedPreferences prefs = await SharedPreferences.getInstance(); //cara menimpan data secara lokal
    _isDarkTheme = isDark;
    await prefs.setBool("isDarkTheme", isDark);
    notifyListeners(); //budaknya, untuk mereport semua perubahan yang terjadi yg melibatkan provider
  }

  void _loadTheme()  async{ //mengahsilkan result
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //?? => elvis operator: for defining a default value in our variable (to avoid NPE [null pointer exeption])
    _isDarkTheme = prefs.getBool("isDarkTheme") ?? false;
    notifyListeners();
  }
}