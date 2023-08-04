import 'package:finalproject/BottomNavigationBar/bottomNavScreen.dart';
import 'package:finalproject/BottomNavigationBar/secondScreen.dart';
import 'package:finalproject/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

Color myColor = const Color(0xff454b54);

bool click = true;
TextEditingController eRcontroller = TextEditingController();
TextEditingController pRcontroller = TextEditingController();
// TextEditingController firstNameController = TextEditingController();
// TextEditingController lastNameController = TextEditingController();
var formkey = GlobalKey<FormState>();
RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
bool? isRegistered;

class _RegisterScreenState extends State<RegisterScreen> {
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
                  "Register",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: myColor),
                ),
                const SizedBox(
                  height: 70,
                ),
                TextFormField(
                  controller: eRcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "E-Mail must not be empty!";
                    } else if (emailRegex.hasMatch(eRcontroller.text) ==
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
                  controller: pRcontroller,
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
                          await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: eRcontroller.text,
                            password: pRcontroller.text,
                          );

                          // Sign in successful, navigate to next page
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const BottomNaviScreen()),
                          );
                        } catch (error) {
                          String errorMessage = 'Something error!';
                          if(error is FirebaseAuthException) {
                            switch (error.code) {
                              case 'email-already-in-use':
                                errorMessage = 'Email already exists!';
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
                      "Create an account!",
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
                      "Do you have an account?",
                      style: TextStyle(fontSize: 15, color: myColor),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text("Login!"))
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
