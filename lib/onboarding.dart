import 'package:finalproject/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

//bool firstInstall =true;
class _OnBoardingState extends State<OnBoarding> {
  Color myColor = const Color(0xff454b54);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          globalBackgroundColor: Colors.white,
          scrollPhysics: const BouncingScrollPhysics(),
          pages: [
            PageViewModel(
                titleWidget: Text(
                  "Welcome",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: myColor),
                ),
                bodyWidget: const Text(
                  "Explore our app and find out how it can simplify your daily tasks.",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                image: Image.asset("lib/images/1.png")),
            PageViewModel(
                titleWidget: Text(
                  "Easy to use",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: myColor),
                ),
                bodyWidget: const Text(
                  "Set up your profile and customize it to your liking.",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                image: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Image.asset(
                    "lib/images/2.png",
                    height: 200,
                    width: 200,
                  ),
                )),
            PageViewModel(
                titleWidget: Padding(
                  padding: const EdgeInsets.only(top: 175),
                  child: Image.asset("lib/images/3.png"),
                ),
                body: "")
            //  image: Image.asset("lib/images/3.png"))
          ],
          onDone: ()=> onDone(context) ,
          onSkip: ()=> onDone(context),
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: myColor),
          ),
          done: Text(
            "Done",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: myColor),
          ),
          next: Icon(
            Icons.forward,
            color: myColor,
          ),
          dotsDecorator: DotsDecorator(
            size: const Size.square(10),
            activeSize: const Size(30, 10),
            color: Colors.cyan,
            activeColor: myColor,
            spacing: const EdgeInsets.symmetric(horizontal: 3),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
    );
  }
}
void onDone(context) async
{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool("showPage", false);
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      ));
}