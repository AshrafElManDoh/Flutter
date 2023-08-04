import 'dart:async';
import 'package:finalproject/BottomNavigationBar/bottomNavScreen.dart';
import 'package:finalproject/registerScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

Color myColor = const Color(0xff454b54);

bool click = true;
TextEditingController eLcontroller = TextEditingController();
TextEditingController pLcontroller = TextEditingController();
var formkey = GlobalKey<FormState>();
RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: myColor),
                ),
                const SizedBox(
                  height: 70,
                ),
                TextFormField(
                  controller: eLcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "E-Mail must not be empty!";
                    } else if (emailRegex.hasMatch(eLcontroller.text) ==
                        false) {
                      return "E-Mail is invalid";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "E-Mail",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Icon(Icons.email),
                    prefixIconColor: Color(0xff454b54),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password must not be empty!";
                    } else if (value.length < 8) {
                      return "Password's length must be at least 8";
                    }
                    return null;
                  },
                  obscureText: click,
                  controller: pLcontroller,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    prefixIconColor: const Color(0xff454b54),
                    suffixIcon: IconButton(
                      icon: click == true
                          ? const Icon(
                              Icons.visibility,
                              color: Color(0xff454b54),
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Color(0xff454b54),
                            ),
                      onPressed: () {
                        click = !click;
                        setState(() {});
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25), color: myColor),
                  child: MaterialButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        try {
                           await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: eLcontroller.text,
                            password: pLcontroller.text,
                          );

                          // Sign in successful, navigate to next page
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const BottomNaviScreen()),
                          );
                        } catch (error) {
                          String errorMessage = 'something error!';
                          if(error is FirebaseAuthException) {
                            switch (error.code) {
                            case 'user-not-found':
                              errorMessage = 'this E-Mail not found!';
                              break;
                            case 'wrong-password':
                              errorMessage = "Password isn't correct!" ;
                              break;
                          }
                          }

                          Fluttertoast.showToast(
                            msg: errorMessage,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            textColor: Colors.black54,
                          );
                        }
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 15, color: myColor),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterScreen()));
                        },
                        child: const Text("Register!"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
