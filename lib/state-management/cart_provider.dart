import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int price;
  final String image;
  //default quantity is 1
  int quantity;

  CartItem({required this.id, required this.title, required this.price, required this.image, this.quantity = 1}); //fungsi nya untuk menampung data
}

//to knowing what's difference betwee oop and FP (functional porgrmming)
class CartProvider with ChangeNotifier{
  Map<String, CartItem> _items = {}; //setter

  Map<String, CartItem> get items => _items; //getter

  //fungsinya untuk menghandle perhitungan jumlah total harga
  int get totalPrice {
    return _items.values.fold( //salah satu syntaks yang mau mengoprasikan operasi matemika
    //initial status sebelum operasi matematika ketika dilakukan
      0,
      (sum, item) => sum + item.price * item.quantity, //sum mendatakan adanya pertambahan 
    );
  }


  void addItem(String id, String title, int price, String image, int quantity) {
    //menambahkan item ke keranjang dengan jumlah yg di tentukan dri cart counter
    if (_items.containsKey(id)) { 
      _items[id]!.quantity += quantity; //akan ada penambahan, 
    } else { //ketika di keranjang tidak ada apa"
        _items[id] = CartItem(id: id, title: title, price: price, image: image, quantity: quantity); //ini adalah fungsi untuk menambahkan item ke dalam cart
    }
    notifyListeners();
  }

  void removeItems(String id) {

    // ini untuk hapus tanpa decrement
    _items.remove(id);
    notifyListeners();

    //dan ini untuk megahous item dengan cara decrement 
    // if(_items.containsKey(id)) {
    //   //kurangi kuantitas item
    //   _items[id]!.quantity--;

    //   //jika kuantitas di keranjang jdi 0, maka hapus item di keranjang
    //   if(_items[id]!.quantity <= 0) { //!. null safety tp jika ! di depan makan itu bank operator
    //     _items.remove(id);
    //   }
    // }
    // notifyListeners();
  }

   void increaseQuantity(String id) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (existingItem) => CartItem(
          id: existingItem.id,
          title: existingItem.title,
          image: existingItem.image,
          price: existingItem.price,
          quantity: existingItem.quantity + 1,
        ),
      );
      notifyListeners();
    }
  }

   void decreaseQuantity(String id) {
    if (_items.containsKey(id) && _items[id]!.quantity > 1) {
      _items.update(
        id,
        (existingItem) => CartItem(
          id: existingItem.id,
          title: existingItem.title,
          image: existingItem.image,
          price: existingItem.price,
          quantity: existingItem.quantity - 1,
        ),
      );
    } else {
      // If quantity becomes 0, remove the item
      removeItems(id);
    }
    notifyListeners();
   }
}