import 'package:flutter/material.dart';

class AboutApplication extends StatelessWidget {
  AboutApplication({super.key});
  Color myColor = const Color(0xff454b54);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
        title: const Text("about app"),
        centerTitle: true,
        actions: const [Icon(Icons.phone_android)],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          const Center(
            child: Text(
              "Welcome to our app!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "The main purpose of the application is to learn from the lectures that I attended."
              "This application was created by Flutters Language."
              "This application is used to display some departments and their products."
              "The application may contain some errors, but when we notice them, they will be modified, God willing."
                  "Stay up to date with the latest updates and improvements.\n "
                  "\n\nContact our support team for any assistance or inquiries on +2001021398393.",
              style: TextStyle(fontSize: 20, color: myColor),
            ),
          )
        ],
      ),
    );
  }
}
