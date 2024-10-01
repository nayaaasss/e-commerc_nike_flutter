import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;

  Product({
    // this adalah untuk menandakan bahwa objek terkait hanya bisa diakses oleh Class terkait
    //atau class yg sebelumnya memanggil class prduct
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Product> product = [
  Product(
    id: 1, 
    image: 'assets/images/Nike_6.png', 
    title: "Nike Club Max 4", 
    price: 47, 
    description: descriptionText, 
    size: 50, 
    color: const Color.fromARGB(255, 225, 244, 255)
  ),
   
  Product(
    id: 2, 
    image: 'assets/images/Nike_5.png', 
    title: "Nike Air Max 43", 
    price: 76, 
    description: descriptionText, 
    size: 46, 
    color: const Color.fromARGB(255, 255, 213, 176)
  ),

  Product(
    id: 3, 
    image: 'assets/images/Nike_4.png', 
    title: "Nike Jordan 220", 
    price: 45, 
    description: descriptionText, 
    size: 43, 
    color: const Color.fromARGB(255, 194, 209, 255)
  ),
  
  Product(
    id: 4, 
    image: 'assets/images/Nike_3.png', 
    title: "Nike Air Max 42", 
    price: 30, 
    description: descriptionText, 
    size: 63, 
    color: const Color.fromARGB(255, 239, 221, 255)
  ),

  Product(
    id: 5, 
    image: 'assets/images/Nike_1.png', 
    title: "Nike Club Max 2", 
    price: 25, 
    description: descriptionText, 
    size: 38, 
    color: const Color.fromARGB(255, 255, 187, 193)
    ),
  
  Product(
    id: 6, 
    image: 'assets/images/Nike_7.png', 
    title: "Nike Air Max 36", 
    price: 31, 
    description: descriptionText, 
    size: 12, 
    color: const Color.fromARGB(255, 255, 199, 186),
   ),
];

String descriptionText = "muat banyak banget, dari laptop sampai cemilan-cemilan lo buat gaming marathon!, Super tahan banting, cocok buat lo yang suka jalan jauh tapi ga mau ribet.";