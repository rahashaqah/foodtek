// lib/model/product_model.dart
class Product {
  final String name;
  final double price;

  Product(this.name, this.price);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['name'],
      json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
    };
  }
}