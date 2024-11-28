import 'package:e_commerce/consts.dart';
import 'package:e_commerce/ui/Auth/register.dart';
import 'package:e_commerce/ui/home/catalogu_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>(); //ini untuk form key nya, wajib ketika mau memanggil teextField
  final _emailController = TextEditingController(); //controller disini di gunakan untuk mengakses textField
  final _passwordController = TextEditingController();
  final FToast fToast = FToast();

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("hi Welcome",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16),
                    labelText: "Email",
                    labelStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(46),
                    ),
                      suffixIcon: const Icon(Icons.person),
                  ),
                  validator: (value) { //validasi value
                    if (value == null || value.isEmpty) { //dicek dlu, kalau misalkan valuenya kosong maka dia akan mereturn email is required
                      return "Email is Required"; //jika kosong akan keluar ini
                    }
                    if (!value.endsWith("gmail.com")) { //karna ada tanda seru makanya jd negativ, kalau valuenya tidak diakhiri dg gmail.com maka return
                      return "Please fill with a valid email";
                    }
                    return null; //biar pas isi ga langsung pindah halaman
                  },
                  ),

                  const SizedBox(height: defaultPadding,),

                  TextFormField(
                  controller: _passwordController,
                  obscureText: true, //pw jadi titik"
                  decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(46)
                  ),
                   suffixIcon: const Icon(Icons.lock),
                  ),
                  validator: (value) {
                   if (value == null || value.isEmpty) {  
                     return "Password is required";
                   }
                   return null; 
                  },
                  ),

                  const SizedBox(height: 20,),
                  ElevatedButton(
                   
                    onPressed: () {
                       if (_formKey.currentState!.validate()) { //dia akan melakukan validasi kepada formField, dan akan melakukan execute ke Navigator
                       fToast.showToast(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 20.0),
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.8
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Text(
                              "succesfully",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          gravity: ToastGravity.BOTTOM,
                          toastDuration: const Duration(seconds: 2)
                          );
                        Navigator.pushNamed(context, '/catalogu');// (context) representasi dri halaman yang sekarang 
                       }
                   }, 
                   style: ElevatedButton.styleFrom(backgroundColor: secondColor),
                    child: const Padding(
                      padding:EdgeInsets.symmetric(horizontal: 135, vertical: 15),
                      child: Text("login", style: TextStyle(color: Colors.white),),
                    ),
                    ),
                    SizedBox(height: 10,),
                     TextButton(onPressed: () {
                      Navigator.pushNamed(context, '/register');
                      },
                      child: const Text("New here? Create an account!", style: TextStyle(color: Color(0xFF6E6B8F)))),

                    Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 1, // Ketebalan garis
                          indent: 20,
                          endIndent: 10,
                          color: Colors.grey, // Warna garis
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("OR", style: TextStyle(fontSize: 14, color: Colors.grey),),
                      ),
                      Expanded(
                        child: Divider(
                          height: 1,
                           indent: 20,
                          endIndent: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column( 
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(46),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/Group 35537.png",
                            width: 20,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "Login with Google",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10), // Jarak antara tombol
                     ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(46),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/Vector.png",
                            width: 20,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "Login with Facebook",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                                ),
                )

              ],
            )),
        
        ),
      ),
    );
  }
}