import 'package:e_commerce/consts.dart';
import 'package:e_commerce/ui/Auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatelessWidget {
  //const RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FToast fToast = FToast();

  final _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
      return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome!",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Your Email",
                    labelStyle: const TextStyle(
                      color: secondaryColor
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: secondaryColor
                      ),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: primaryColor
                      ),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: Colors.red
                      ),
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                  // If else buat login.
                  validator: (value) {
                    //  Jika gak ada value maka muncul pesan. 
                    if (value == null || value.isEmpty) {
                      return "Email is required!";
                    }
                    if(!value.endsWith(".gmail.com")) {
                      return "Pleas fill with valid email";
                    }
                  // Tapi jika ada, maka dia gak return apa-apa. Paling ke homepage :v 
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    labelText: "Your Password",
                    labelStyle: const TextStyle(
                      color: secondaryColor
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: secondaryColor
                      ),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: primaryColor
                      ),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: Colors.red
                      ),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off
                      ),
                      onPressed: () {
                        // setState() {
                        //   _passwordVisible = !_passwordVisible;
                        // }
                      }, 
                    )
                  ),
                  validator:(value) {
                    if (value == null || value.isEmpty) {
                      return "Passsword is reqired";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: const TextStyle(
                      color: secondaryColor
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: secondaryColor
                      ),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: primaryColor
                      ),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: Colors.red
                      ),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is reqired";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondColor,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
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
                              "succesfully created an account!",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          gravity: ToastGravity.BOTTOM,
                          toastDuration: const Duration(seconds: 2)
                          );
                        Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => LoginScreen())
                        );
                      }
                    }, 
                    child: const Text("Sign Up",
                    style: TextStyle(color: Colors.white),
                    )
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                      Navigator.pushNamed(context, '/login');
                  }, 
                  child: const Text(
                    "Already have account? Sign in"
                  )
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}