import 'dart:io';

import 'package:training_works/book_store/book_data_list.dart';

addBook(){
  print("Enter Book Name :");
  String? name = stdin.readLineSync()!;
  print("Enter Book Author :");
  String? author = stdin.readLineSync()!;
  print("Enter Book Quantity :");
  double? quantity = double.parse(stdin.readLineSync()!);
  print("Enter Book Price :");
  int? price = int.parse(stdin.readLineSync()!);
  print("Enter Book Category :");
  String? category = stdin.readLineSync()!;
  int id = bookData[bookData.length-1]["id"] + 1;

  Map newBook = {
    "id" : id,
    "name" : name,
    "author" : author,
    "category" : category.split(','),
    "price" : price,
    "quantity" : quantity
  };
  for(int i=0; i<bookData.length;i++){
    if(bookData[i]['name']==newBook["name"]){
      print("Book name exist before, Try Again");
      continue;
    }
    else{
      bookData.add(newBook);
      print("Successfully Added, Books Now : ${bookData.length}");
      break;
    }
  }
}