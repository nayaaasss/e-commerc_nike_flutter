import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget { //banyak perubahan
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  //untuk inisialisasi view pager
  List<String> categories = [
    "Shoes",
    "Clothing",
    "Socks",
    "Cap"
  ];

  List<IconData> categoryIcons = [
    Icons.sports_handball, // Icon untuk Shoes
    Icons.checkroom, // Icon untuk Clothing
    Icons.sports_baseball, // Icon untuk Cap
    Icons.sports_baseball, // Icon untuk Cap
  ];

  int selectedIndex = 0; //variable untuk kasi tau

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: SizedBox(
        height: 50,
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
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
             decoration: BoxDecoration(
              color: selectedIndex == index? Color.fromARGB(255, 111, 168, 255) : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              ),
                child: Column(
                  children: [
                    Icon(
                    categoryIcons[index], // Icon sesuai kategori
                    color: selectedIndex == index? Colors.white
                        : Colors.black,
                    size: 16, // Ukuran icon
                  ),
                    const SizedBox(width: 9),
                    Text(
                      categories[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == index? Colors.white : secondaryColor
                      ),
                    ),
                  ],
                ),
              ),
            
            ],
          ),
        ),
      );
  }
}