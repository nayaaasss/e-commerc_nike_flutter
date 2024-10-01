import 'package:e_commerce/size_configuration.dart';
import 'package:e_commerce/ui/splash/components/body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); //kita harus panggil ini di start screen (body.dart)
    return const Scaffold( //induknya si body
      body: Body(),
    );
  }
}