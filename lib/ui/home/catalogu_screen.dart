import 'package:e_commerce/consts.dart';
import 'package:e_commerce/favori/Wishlist_screen.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/profile/profile_page.dart';
import 'package:e_commerce/settings/settings_screen.dart';
import 'package:e_commerce/state-management/wishlist_provider.dart';
import 'package:e_commerce/ui/cart/cart_screen.dart';
import 'package:e_commerce/ui/detail/detail_screen.dart';
import 'package:e_commerce/ui/home/components/bottom_nav_bar.dart';
import 'package:e_commerce/ui/home/components/categories.dart';
import 'package:e_commerce/ui/home/components/item_card.dart';
import 'package:flutter/material.dart';

class CataloguScreen extends StatefulWidget {
  const CataloguScreen({super.key});
  

  @override
  State<CataloguScreen> createState() => _CataloguScreenState();
}

class _CataloguScreenState extends State<CataloguScreen> {
  int _selectedIndex = 0;



  final List<Widget> _widgetOptions = [ //dasar untuk bernavigasi via bottom nav bar
    const CataloguScreen(),
    const WishlistScreen(),
    const SettingsScreen(),
    const ProfilePage(),
    
  ];

  //function untuk aksi tap pada bottom nav bar
  void _onItemTapped(int index) {
    setState(() {
      /*menyatakan bahwa initial actionnya adalah untuk menampilkan objek yg berada pada index 0*/
      _selectedIndex = index;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0 
      ?AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WishlistScreen(),
                    ),
                  );
            },
            icon: const Icon(Icons.favorite_border_outlined),
          ),
          IconButton(
            onPressed: () {
               Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ),
                  );
            },
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
        title: const Row(
          children: [
              CircleAvatar(
              radius: 20, // Ukuran gambar
              backgroundImage: AssetImage('assets/images/User 03C.png'), // Path ke gambar lokal
              // Jika gambar diambil dari internet, gunakan Image.network
              // backgroundImage: NetworkImage('https://example.com/profile.jpg'),
            ),
            Padding(
              padding: EdgeInsets.only(left: defaultPadding),
              child: Text(
                textAlign: TextAlign.center,
                "Welcome",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 23,
                ),
              ),
            ),
          ],
        ),
      )
      : null,
      
      body: _selectedIndex == 0 ? SingleChildScrollView( //kalau misakan selectedindex 0 maka akan memunculkan catalog
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultPadding),
            // Search bar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Icon(
                      Icons.search_outlined,
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Looking for shoes',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: secondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Banner
        Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Agar scroll horizontal
          child: Row(
            children: [
              Container(
                      margin: EdgeInsets.only(left: 20, right: 10),
                      child: Image.asset(
                        'assets/images/Group 1000000799.png',
                        width: 350,
                        height: 150,
                     
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Image.asset(
                        'assets/images/Group 1000000799.png',
                        width: 350,
                        height: 150,
                      
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Image.asset(
                        'assets/images/Group 1000000799.png',
                        width: 350,
                        height: 150,
                      ),
                    ),
                    // Tambahkan gambar lain di sini
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
                top: defaultPadding,
                bottom: 4
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'categories',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                      ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: secondColor,
                      fontSize: 15,
                      
                      ),
                  ),
                ],
              ),
            ),

            const Categories(),
            // GridView
                       // Horizontal Scrollable Grid
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: product.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                  product: product[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(product: product[index]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
       )
       : _widgetOptions[_selectedIndex], //titik dua itu adalah repersentasi dari ternari operator di flutter, tampilkan widget berdasarkan index
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex, 
          onItemTapped: _onItemTapped,
          )
    );
  }
   
  }

  

