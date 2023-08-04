import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/productModel.dart';

class APIProvider {
  ProductModel? productModel;
  getProduct() async {
    await FirebaseFirestore.instance
        .collection("products")
        .doc("item1")
        .get()
        .then((value) {
      productModel = ProductModel.fromJson(value.data()!);
    });
    return productModel;
  }
}
