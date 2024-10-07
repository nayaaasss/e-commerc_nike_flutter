import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product, required this.press});

  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
                
              ),
              child: Stack(
                children: [ 
                  Hero(
                  tag: "${product.id}",
                  child: Image.asset(product.image),
                ),
                Container(
                  padding: const EdgeInsets.all(6), // Padding untuk ikon
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7), // Latar belakang dengan opasitas
                          shape: BoxShape.circle, 
                ),
                 child: const Icon(
                          Icons.favorite_border, 
                          color: Colors.blue, 
                          size: 20,
                        ),
                ),
                
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5), 
                child: Text(
                  product.title,
                  style: const TextStyle(color: textColor),
                ),  
              ),
            ],
          ),
          Row(
            children: [
              Text("\$ ${product.price}",
              style: const TextStyle(fontWeight: FontWeight.bold, color: textColor),),
            ],
          ),
        ],
      ),
    );
  }
}
