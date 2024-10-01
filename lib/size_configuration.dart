import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData = 
  MediaQueryData.fromView( //mediaquery data untuk ukuran agar responsive
    // ignore: deprecated_member_use
    WidgetsBinding.instance.window
  );
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double defaultSize = 0.0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight= _mediaQueryData.size.height;
  }
}

// function that used to get the propotioned height size of the screem
double getProportionedScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * screenHeight; //ukuran yang biasa si pake atau layout height size that commnly used
}
// function that used to get the propotioned height size of the screem
double getProportionedScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 365.0) * screenWidth; //ukuran yang biasa si pake atau layout height size that commnly used
}