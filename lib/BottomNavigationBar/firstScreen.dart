import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Color myColor = const Color(0xff454b54);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

           SingleChildScrollView(
             child: Center(
               child: SizedBox(
                 width: 500,
                 height: 710,
                 child: StreamBuilder<QuerySnapshot>(
                     stream: FirebaseFirestore.instance.collection('products').snapshots(),
                     builder: (context,snapshot){
                       List<Column> productWidgets=[];
                       if(snapshot.hasData)
                         {
                           final products=snapshot.data?.docs.toList();
                           for(var product in products!)
                             {
                               final productWidget= Column(
                                   children: [
                                     const SizedBox(
                                       height: 20,
                                     ),
                                     Image.network(
                                       "${product['image']}",
                                       width: 250,
                                       height: 250,
                                     ),
                                     Text(
                                       "${product['name']}",
                                       style: const TextStyle(
                                           fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                                     ),
                                     Text(
                                       "${product['price']}",
                                       style: const TextStyle(
                                           fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                                     ),Container(
                                       height: 15,
                                       decoration: const BoxDecoration(
                                         color: Colors.white
                                       ),
                                     )
                                   ],
                                 )
                               ; productWidgets.add(productWidget);
                             }
                         } if (snapshot.connectionState == ConnectionState.waiting) {
                         return const Center(child: CircularProgressIndicator()); // Or any loading indicator
                       }
                       return   Container(
                           decoration: const BoxDecoration(
                             color: Color(0xff454b54),
                           ),
                           child: ListView(
                               children: productWidgets,
                           ),
                       );
                     }),
               ),
             ),
           ),
    );
  }
}

