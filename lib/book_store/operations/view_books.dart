import 'package:training_works/book_store/book_data_list.dart';

viewBooks(){
  for(int i=0; i<bookData.length;i++){
    print("[${bookData[i]["name"]}](${bookData[i]["id"]}) --  Author: ${bookData[i]["author"]}, Quantity: ${bookData[i]["quantity"]}, Price: ${bookData[i]["price"]}, Category: ${bookData[i]["category"]}, status: ${bookData[i]["quantity"] > 0? "Available":"Sold Out"}");
  }
  return "";
}

