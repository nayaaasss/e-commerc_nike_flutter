import 'package:e_commerce/consts.dart';
import 'package:e_commerce/size_configuration.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    required this.text,
    required this.image,
  });
  final String text, image;

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          "Nike",
          style: TextStyle(
            color: primaryDeskColor,
            fontSize: getProportionedScreenWidth(30.0),
            fontWeight: FontWeight.w500,
            fontFamily: 'poppins',
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Image.asset(image)
      ],
    );
  }
}
