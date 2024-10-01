import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget { //banyak perubahan
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Bag",
    "Footwear",
    "Watches",
    "Dress"
  ];
  int selectedIndex = 0; //variable untuk kasi tau

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: SizedBox(
        height: 25,
        child: ListView.builder( //untuk membangun dan menampung data yang mau di tampilkan di UI
          scrollDirection: Axis.horizontal, //untuk mengatur arah scrollnya
          itemCount: categories.length,
          itemBuilder: (context, index) => _buildCategory(index)
          ),
      ),
    );
  }

  GestureDetector _buildCategory(int index) { //index itu tipe data angka
    return GestureDetector( //untuk mendeteksi gesture mau itu tangan atau ga pen
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              Text(
                categories[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index? const Color(0xFF0D6EFD) : secondaryColor
                ),
              ),
             Container(
              margin: const EdgeInsets.only(
               top: 3
              ),
              height: 2,
              width: 50,
              color: selectedIndex == index ? const Color(0xFF0D6EFD) : secondaryColor,
             )
            ],
          ),
        ),
      );
  }
}