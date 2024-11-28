import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCounter extends StatefulWidget {
  final Product product;

  //ini adalah sebuah callnack untuk mengirim quantity ke add to cart
  final Function(int) onQuantityChanged;

  const CartCounter({super.key, required this.product, required this.onQuantityChanged});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  //biar defaultnya 1
  int quantity = 1; //minimal 1 klo kmu mau masukin keranjang (skenario), makanya di tambahkan default value

  @override
  Widget build(BuildContext context) {
    //inisialisasi provider
    final cartProvider = Provider.of<CartProvider>(context);

    return Row(
      children: <Widget>[
        //logika untuk tombol pengurangan
        OutlinedButton(
          style: OutlinedButton.styleFrom(
             minimumSize: const Size(35, 35),
             padding: EdgeInsets.zero,
               shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          child: Icon(Icons.remove),
          onPressed: quantity > 1
          ? () { //fucntion yang mempunya blok body tp tidak mempunyai nama
            //setsatet hanya digunakan untuk inisialisasi awal
            setState(() {
              // akan mengurangi secara lokal 
              //kalau true dia akan menjalankan decremen bottonnya aktif 
              quantity--; 
            });
            //untuk mengirim quantity terbaru
             cartProvider.removeItems(widget.product.id.toString()); 
            // widget.onQuantityChanged(quantity);
          } //false
          // akan mendisable tombol jika kuantitas <= 1
          : null,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              quantity.toString().padLeft(2, "0"), //agar tdk ada error saat di tambahkan 2 digit
              style: const TextStyle(fontSize: 18, color: textColor),
            ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
              minimumSize: const Size(35, 35),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
              ),
              child: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  // menambahkan kuantitas secara lokal
                  /* 
                - pendeklarasian informasi yang akan dikirimkan ke addToCart(tombol keranjang)
                - merupakan starting point dimana quantitas akan dibawa oleh tombol keranjang ke halaman cart screen
                */
                  quantity++;
                });
                  cartProvider.addItem(
                    widget.product.id.toString(),
                    widget.product.title,
                    widget.product.price,
                    widget.product.image,
                    1
                  );
                // widget.onQuantityChanged(quantity);
              },
              )
      ],
    );
  }
}