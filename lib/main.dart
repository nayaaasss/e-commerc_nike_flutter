import 'package:e_commerce/consts.dart';
import 'package:e_commerce/favori/Wishlist_screen.dart';
import 'package:e_commerce/profile/profile_page.dart';
import 'package:e_commerce/settings/settings_screen.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:e_commerce/state-management/wishlist_provider.dart';
import 'package:e_commerce/ui/Auth/login_screen.dart';
import 'package:e_commerce/ui/Auth/register.dart';
import 'package:e_commerce/ui/home/catalogu_screen.dart';
import 'package:e_commerce/ui/home/components/bottom_nav_bar.dart';
import 'package:e_commerce/ui/splash/components/body.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() { //function utama yang mengatur segalanya 
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()), 
      ChangeNotifierProvider(create: (_) => CartProvider()), 
      ChangeNotifierProvider(create: (_) => WishlistProvider()), 

    ],
    child: const FlutShop()
  )
);
}

class FlutShop extends StatefulWidget {
  const FlutShop({super.key});

  @override
  State<FlutShop> createState() => _FlutShopState();
}

class _FlutShopState extends State<FlutShop> {
  

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) { 
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nike', //ini di gunakan untuk
        theme: ThemeData(
        brightness: themeProvider.isDarkTheme ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
        fontFamily: 'Muli',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: themeProvider.isDarkTheme ? Colors.white : Colors.black), //diambil dari consts
          bodySmall: TextStyle(color: themeProvider.isDarkTheme ? Colors.white : Colors.black)
        ),
        
        ),
        initialRoute: '/splash', // Set route pertama kali ke halaman login
        routes: {
          '/splash' : (context) => const Body(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => Register(),
          '/catalogu' : (context) => const CataloguScreen(),
          '/settings' : (context) => const SettingsScreen(),
        },
        );
       },
    );
  }
}