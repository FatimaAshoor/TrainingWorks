import 'dart:convert';

class BooksData {
  int? id;
  String? name;
  String? author;
  List<String>? category;
  double? price;
  int? quantity;
  String? status;


  BooksData(
      {this.id,
        this.name,
        this.author,
        this.category,
        this.price,
        this.quantity,
        this.status});

  BooksData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    author = json['author'];
    category = json['category'].cast<String>();
    price = json['price'];
    quantity = json['quantity'];
    status = json['status'];
  }
}

