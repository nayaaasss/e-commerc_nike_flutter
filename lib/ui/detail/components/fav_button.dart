
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.product});

  final Product product; //ini disebut inisialisasi

  @override
  Widget build(BuildContext context) {

    //inisialisasi provider
    final WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    //untuk memeriksa apakah product ada di wishlist via tombol fav
    final isFavorite = wishlistProvider.wishlistItems.containsKey(product.id.toString());

    return IconButton(
      onPressed: () {
         if (isFavorite) { //klo misalkan dia ada di favorite makan akan melakukan remove
           //Untuk mengahpus item dri wishlist
           wishlistProvider.removeItemFromFav(product.id.toString());

           //kalau misalkan gada maka dia akan memunculkan ini semua dengan mengklik icon love
         } else {
          wishlistProvider.addItemToFav( //memanggilnya dari file product 
            //berurutan itu ngaruh agar matching tipe datanya
            product.id.toString(), //memakai toString() karena id berbentuk integer
            product.image,
            product.title,
            product.price,
            );
         }
      }, 
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
        color: isFavorite ? Colors.red : Colors.grey.shade600,
      )
      );
  }
}