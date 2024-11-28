import 'package:flutter/material.dart';


class WishlistItem { //acuannya data class atau model yang di file product.dart
  final String id;
  final String title;
  final int price;
  final String image;

  WishlistItem(this.image, {required this.id, required this.title, required this.price});
}


class WishlistProvider with ChangeNotifier{
  final Map<String, WishlistItem> _wishlistItems = {};

  Map<String, WishlistItem> get wishlistItems => _wishlistItems;

  int get itemCount => _wishlistItems.length; //mau mendapatkan size dri si wishlist itemnya 

  void addItemToFav(String image, String id, String title, int price) {
    if (_wishlistItems.containsKey(id)) { 
      return;
      //jika sudah ada item yang di tambahkan ke wishlist
    } else {
      _wishlistItems.putIfAbsent(
        id, () => WishlistItem(image, id: id, title: title, price: price)
      );
    }
    notifyListeners();
  }

  void removeItemFromFav(String id) { //penghapusan item wishlist
    _wishlistItems.remove(id);
    notifyListeners();
  }

  void clearWishlist() {
    _wishlistItems.clear(); //untuk membersihkan cache
    notifyListeners();
  }
}