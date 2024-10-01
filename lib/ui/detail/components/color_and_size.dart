import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Color",
                style: TextStyle(
                  fontSize: 16, 
                  color: textColor
                  ),
                ),
              Row(
                children: [
                  ColorPicker(
                    color: Color(0xFF3D82AE), 
                    isSelected: true, 
                  ),
                  ColorPicker(
                    color: Color(0xFFF8C078), 
                    isSelected: false, 
                  ),
                  ColorPicker(
                    color: Color(0xFF989493), 
                    isSelected: false, 
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          //jalan lain untuk menampilkan dan modifikasi textmya
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "size",
                style: TextStyle(color: textColor),
              ),
              RichText( //kita pakai ketika punya 2 tema seperti gelap dan terang.
                              //sama" untuk styling text cuman bedanya kalau text superclass, tpi klo textspan itu subclass dari rich text, tapi tujuannya sama 
                text: TextSpan(
                  style: const TextStyle(color: textColor), //kalau cuman punya stu argumen 1 baris aja
                  children: [
                    TextSpan(
                      text: "${product.size} cm",
                      style: Theme.of(context)
                      .textTheme //ini method
                      .titleLarge! 
                      .copyWith(fontWeight: FontWeight.bold)
                      )
                  ]
                ),
              ),
            ],
          )
          )
      ],
    );
  }
}

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key, required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: defaultPadding,
        right: defaultPadding
      ),
      padding: const EdgeInsets.all(2.5),
      width: 24,
      height: 24,
      // modidikasi untuk border dari colorPickernya
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent
        )
      ),

      child: DecoratedBox( //biar bisa dipake subclass dan bisa di gunakan untuk widget
        // modifikasi untuk colorPickernya
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
        )
        ),
    );
  }
}