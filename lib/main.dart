import 'package:e_commerce/consts.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlutShop());
}

class FlutShop extends StatelessWidget {
  const FlutShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nike', //ini di gunakan untuk
      theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Muli',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: primaryDeskColor), //diambil dari consts
        bodySmall: TextStyle(color: textColor)
      )
      ),
      home: const SplashScreen(),
    );
  }
}