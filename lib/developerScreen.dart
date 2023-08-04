import 'package:flutter/material.dart';

class DeveloperScreen extends StatelessWidget {
  DeveloperScreen({super.key});
  Color myColor = const Color(0xff454b54);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
        title: const Text("Developer"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          const Center(
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              radius: 70,
              backgroundImage: AssetImage("lib/images/me.jpg"),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: Text(
              "Ashraf ElManDoh",
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: myColor),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "-Student at the Faculty of Engineering",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: myColor),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "-Level 4",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: myColor),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "-Mobile Application Developer",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: myColor),
              ),
              const SizedBox(
                height: 300,
              ),
              Text(" 'I hope you like this application' ❤️ ",
                  style: TextStyle(fontSize: 20, color: myColor))
            ],
          )
        ],
      ),
    );
  }
}
