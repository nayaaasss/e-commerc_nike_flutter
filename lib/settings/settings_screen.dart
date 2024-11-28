import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:e_commerce/ui/home/catalogu_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
   bool isFaceIDEnabled = false; //klo ini untuk kondisi agar bisa menambahkan togglenya dan bisa di otak atik

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); //mengambil data dari provider

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Account And Setting',
            style: TextStyle(fontSize: 18, color: themeProvider.isDarkTheme ? Colors.white : Color(0xFF1A242F),),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const CataloguScreen(),
              ),
            );
          },
        ),
        
        //ini untuk modifikasi thementa
        actions: [
          
          IconButton(
            onPressed: () {
              themeProvider.toggleTheme(!themeProvider.isDarkTheme); //karna isDarkTheme false maka yang muncul duluan itu light
            },
            icon: Icon(
              themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
              color: themeProvider.isDarkTheme ? Colors.white : Colors.amber,
            ),
          ),
        ],
      ),

      //untuk memmulai bagian body dan membuat seperti notifikasi setting
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Account',
                style: TextStyle(
                  color: themeProvider.isDarkTheme ? Colors.white : Color(0xFF1A242F),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // 1
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: themeProvider.isDarkTheme ? Colors.white : Color(0xFF1A242F), // Border color
                      width: 0.2, // Border thickness
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: defaultPadding), // Space between text and underline
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.notification_add, size: 24),
                    SizedBox(width: 16), // Adjusts spacing between icon and text
                    Text(
                      'Notification Setting',
                      style: TextStyle(
                        color: Color(0xFF1A242F),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                     Spacer(),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
            ),

            // 2
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                decoration: const BoxDecoration( //ini kalau mau membuat garis bawahnya doang!!
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF1A242F),
                      width: 0.2, // untuk ketebalan bordernya
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: defaultPadding), 
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart, size: 24),
                    SizedBox(width: 16),
                    Text(
                      'Shipping Address',
                      style: TextStyle(
                        color: Color(0xFF1A242F),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                     Spacer(),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
            ),

            // 3
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF1A242F), 
                      width: 0.2,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: defaultPadding), 
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.payment, size: 24),
                    SizedBox(width: 16), 
                    Text(
                      'Payment Info',
                      style: TextStyle(
                        color: Color(0xFF1A242F),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                     Spacer(),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
            ),

            // 4
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF1A242F), 
                      width: 0.2, 
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: defaultPadding), 
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete_rounded, size: 24),
                    SizedBox(width: 16), 
                    Text(
                      'Delete Account',
                      style: TextStyle(
                        color: Color(0xFF1A242F),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                     Spacer(),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
            ),
            //ini untuk title app setting
              Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'App Setting',
                    style: TextStyle(
                      color: Color(0xFF1A242F),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

               //ini untuk bagian togglenya
               const SizedBox(height: 20),
               Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF1A242F),
                          width: 0.5,
                          ), 
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Eneble Push Notifications',
                          style: TextStyle(
                            color: Color(0xFF1A242F),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Switch(
                          value: isFaceIDEnabled, 
                          onChanged: (bool newValue) {
                            setState(() {
                              isFaceIDEnabled = newValue;
                            });
                          },
                          activeColor: Colors.blue, 
                        ),
                      ],
                    ),
                  ),


                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF1A242F), 
                          width: 0.5,
                          ), // Underline
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Eneble Push Notifications',
                          style: TextStyle(
                            color: Color(0xFF1A242F),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Switch(
                          value: isFaceIDEnabled, 
                          onChanged: (bool newValue) {
                            setState(() {
                              isFaceIDEnabled = newValue;
                            });
                          },
                          activeColor: Colors.blue, 
                        ),
                      ],
                    ),
                  ),


                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF1A242F), 
                          width: 0.5,
                          ), // Underline
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Eneble Location Services',
                          style: TextStyle(
                            color: Color(0xFF1A242F),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Switch(
                          value: isFaceIDEnabled, 
                          onChanged: (bool newValue) {
                            setState(() {
                              isFaceIDEnabled = newValue;
                            });
                          },
                          activeColor: Colors.blue, 
                        ),
                      ],
                    ),
                  ),
                ],
              )
                ],
              ),
            ),
          ]
        )
      )
    );
  }
}
