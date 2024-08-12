import 'dart:io';

import '../book_data_list.dart';

disblayOneBook(){
  print("Enter Book Number / ID :");
  String? id = stdin.readLineSync()!;

  for(int i=0; i<bookData.length;i++){
    if(bookData[i]['id']==id){
      print("[${bookData[i]["name"]}](${bookData[i]["id"]}) --  Author: ${bookData[i]["author"]}, Quantity: ${bookData[i]["quantity"]}, Price: ${bookData[i]["price"]}, Category: ${bookData[i]["category"]}, status: ${bookData[i]["quantity"] > 0? "Available":"Sold Out"}");
      break;
    }
  }
}