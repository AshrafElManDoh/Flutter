import 'package:finalproject/BottomNavigationBar/firstScreen.dart';
import 'package:finalproject/BottomNavigationBar/secondScreen.dart';
import 'package:finalproject/BottomNavigationBar/settingScreen.dart';
import 'package:finalproject/BottomNavigationBar/thirdScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

 class BottomNaviScreen extends StatefulWidget {
   // TextEditingController emailController;
   const BottomNaviScreen(
      {super.key,
       // required this.emailController,
      });
  @override
  State<BottomNaviScreen> createState() => _BottomNaviScreenState();
}
Color myColor = const Color(0xff454b54);

class _BottomNaviScreenState extends State<BottomNaviScreen> {
  late String textEmail;
  int currentIndex = 0;

  List<Widget> screens = [
    const FirstScreen(),
    const ThirdScreen(),
    const SecondScreen(),
    AboutScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items:  [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: "Home",
            backgroundColor: myColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            label: "Categories",
            backgroundColor: myColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: "Personal",
            backgroundColor: myColor,
          ),BottomNavigationBarItem(
            icon: const Icon(Icons.info),
            label: "about",
            backgroundColor: myColor,
          ),
        ],
      ),
    );
  }
}
