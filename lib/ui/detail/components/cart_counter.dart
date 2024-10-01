import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfitems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget> [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(30, 30), // Ukuran minimal tombol (width, height)
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
          onPressed: () { //logic
            setState(() {
              if (numOfitems > 1) {  
                setState(() {
                  numOfitems--;
                });
              }
            });
          }, 
          child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
            numOfitems.toString().padLeft(2, "0"), //ini untuk kasi spasi
            style: const TextStyle(
              fontSize: 18,
              color: textColor
              ),
            ),
            ),
            const SizedBox(width: 4),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(30, 30), // Ukuran minimal tombol (width, height)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              onPressed: () {
                setState(() {
                  numOfitems++;
                });
              }, 
              child: const Icon(Icons.add)
              ),
      ],
    );

  }
}