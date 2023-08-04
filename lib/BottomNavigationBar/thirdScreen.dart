import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  Color myColor = const Color(0xff454b54);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 500,
              height: 710,
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('categories').snapshots(),
                  builder: (context,snapshot){
                    List<Column> categoryWidgets=[];
                    if(snapshot.hasData)
                    {
                      final categories=snapshot.data?.docs.toList();
                      for(var category in categories!)
                      {
                        final categoryWidget= Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Image.network(
                              "${category['image']}",
                              width: 250,
                              height: 250,
                            ),
                            Text(
                              "${category['name']}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Container(
                              height: 15,
                              decoration: const BoxDecoration(
                                  color: Colors.white
                              ),
                            )
                          ],
                        )
                        ; categoryWidgets.add(categoryWidget);
                      }
                    } if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator()); // Or any loading indicator
                    }
                    return   Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff454b54),
                      ),
                      child: ListView(
                        children: categoryWidgets,
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}


