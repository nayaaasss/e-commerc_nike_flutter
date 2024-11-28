import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:e_commerce/ui/detail/components/pay_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // Accessing the cartProvider to get the cart data
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: cartProvider.items.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : ListView.builder(
              itemCount: cartProvider.items.length,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.items.values.toList()[index];
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(cartItem.image),
                    ),
                    title: Text(
                      cartItem.title,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text("Quantity: ${cartItem.quantity}"),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "\$${cartItem.price}",
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 16),
                            ),
                            Row(
                              children: <Widget>[
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: const Size(20, 20),
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  child: const Icon(Icons.remove, size: 16,),
                                  onPressed: cartItem.quantity > 1
                                      ? () {
                                          cartProvider.decreaseQuantity(cartItem.id);
                                        }
                                      : null, 
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 2),
                                  child: Text(
                                    cartItem.quantity
                                        .toString()
                                        .padLeft(2, "0"),
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ),
                                
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: const Size(20, 20),
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  child: const Icon(Icons.add, size: 17),
                                  onPressed: () {
                                    cartProvider.increaseQuantity(cartItem.id);
                                  },
                                ),
                                SizedBox(width: 20),
                                 IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red,),
                                onPressed: () {
                                  cartProvider.removeItems(cartItem.id);
                                },
                              ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          bottomNavigationBar: Container(
          margin: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 12, 60, 132),
            borderRadius: BorderRadius.circular(30), 
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "\$${cartProvider.totalPrice}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(), 
             IconButton(
              color: Colors.white,
              icon: const Icon(Icons.arrow_forward_ios_rounded),
              onPressed: () {
                 Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const PayScreen()),
                );
              }, 
              )
            ],
          ),
        ),
      );
  }
}
