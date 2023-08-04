import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/registerScreen.dart';
import 'package:finalproject/loginScreen.dart';
import 'package:finalproject/BottomNavigationBar/secondScreen.dart';

Color myColor = const Color(0xff454b54);

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    super.key,
  });
  getUserFunction() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String? userId = user.email;
      return userId;
    } else {
      return "null";
    }
  }
  getUserUidFunction() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String? userId = user.uid;
      return userId;
    } else {
      return "null";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: CircleAvatar(
                  backgroundColor: Color(0xff454b54),
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  "E-Mail : ",
                  style: TextStyle(fontSize: 25, color: Colors.black54),
                ),
                Expanded(
                  child: Text(
                    getUserFunction(),
                    style: TextStyle(fontSize: 25, color: myColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                )
              ],
            ),const SizedBox(
              height: 25,
            ),Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  "UID : ",
                  style: TextStyle(fontSize: 25, color: Colors.black54),
                ),
                Expanded(
                  child: Text(
                    getUserUidFunction(),
                    style: TextStyle(fontSize: 25, color: myColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
