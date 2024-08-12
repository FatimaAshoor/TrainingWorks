import 'dart:io';

import '../book_data_list.dart';

searchBook(){
  print("Enter Your Search Word (Name / Category) : ");
  String? key= stdin.readLineSync()!;
  List searchList =[];
  for(int i=0; i<bookData.length; i++){

    // متبقي البحث في عناصر الليست
    if(bookData[i]['name'].contains(key) || bookData[i]['category'].contains(key)){
      print ("[${bookData[i]["name"]}](${bookData[i]["id"]}) --  Author: ${bookData[i]["author"]}, Quantity: ${bookData[i]["quantity"]}, Price: ${bookData[i]["price"]}, Category: ${bookData[i]["category"]}, status: ${bookData[i]["quantity"] > 0? "Available":"Sold Out"}");
    }
    else{
      print("No");
      break;
    }
  }
}