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
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image),
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
              const Padding(
                padding: EdgeInsets.only(top:8, left: 30),
                child: Icon((Icons.favorite_border_outlined)),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 1.0), 
                child: Text("\$ ${product.price}",
                style: const TextStyle(fontWeight: FontWeight.bold, color: textColor),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
