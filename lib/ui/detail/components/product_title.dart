import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    //definisikan ukuran proposional gambar sebagai variable const
 
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Leather Hand Bag",
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))
          ),
          Text(
            product.title,
            style: const TextStyle(
              
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: defaultPadding),
          Row(
            children: [
              Column(
                children: [
                  const Text(
                    "price",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  Text(
                    "${product.price}",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Hero(
                  tag: "${product.id}", 
                  child: Image.asset(
                    product.image,
                    width: 220,
                    height: 250,
                    fit: BoxFit.contain,
                  )
                  ),
              ),
            ],
          ),
        ],
      ),
      );
  }
}