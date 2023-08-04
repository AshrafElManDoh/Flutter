class ProductModel {
  String? image;
  String? name;
String? price;
  ProductModel({this.image, this.name,this.price});
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      ProductModel(image: json['image'], name: json['name'],price: json['price']);
}
