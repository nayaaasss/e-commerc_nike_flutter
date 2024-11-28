import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/state-management/wishlist_provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Wishlist'),
        centerTitle: true,
        backgroundColor: isDarkTheme ? Colors.black : Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkTheme ? Colors.white : Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: wishlistProvider.wishlistItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: isDarkTheme ? Colors.white24 : Colors.black26,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Your wishlist is empty!",
                    style: TextStyle(
                      fontSize: 18,
                      color: isDarkTheme ? Colors.white54 : Colors.black54,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: wishlistProvider.wishlistItems.length,
              itemBuilder: (context, index) {
                final wishlistItem = wishlistProvider.wishlistItems.values.elementAt(index);

                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 130,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(wishlistItem.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  wishlistItem.title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkTheme ? Colors.white : Colors.black87,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "\$${wishlistItem.price.toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: isDarkTheme ? Colors.amber : Colors.orange,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: secondColor,
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      ),
                                      child: const Text(
                                        'Add to Cart',
                                        style: TextStyle(fontSize: 14, color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    // Tombol Remove
                                    TextButton(
                                      onPressed: () {
                                        wishlistProvider.removeItemFromFav(wishlistItem.id);
                                      },
                                      child: const Text(
                                        'Remove',
                                        style: TextStyle(color: Colors.redAccent),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                           if (index < wishlistProvider.wishlistItems.length - 1)
                              const Divider(
                                thickness: 1,
                                color: Colors.black12,
                                indent: 16,
                                endIndent: 16,
                              ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
