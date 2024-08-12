import 'dart:io';

import '../book_data_list.dart';
import 'cart_list.dart';

manageCart(){
  if(cartList.isEmpty){
    print( "Your Cart is Empty");
  }
  else{
    for(int i=0; i<bookData.length;i++){
      print("Your Cart Contains 3 Items :\n $i. [${bookData[i]["name"]}](${bookData[i]["id"]}) --  Author: ${bookData[i]["author"]}, Quantity: ${bookData[i]["quantity"]}, Price: ${bookData[i]["price"]}, Category: ${bookData[i]["category"]}, status: ${bookData[i]["quantity"] > 0? "Available":"Sold Out"}");

      print("Do you want to remove item from cart (Y/N) ?");
      String? ans = stdin.readLineSync()!;
      if(ans=="Y"){
        print("Enter Book Numbers you want to remove separated by commas :");
        String? numbers = stdin.readLineSync()!;
        List numList = numbers.split(',');
        for(int i in numList){
          cartList.removeAt(i);
        }
        continue;
      }
      else if (ans=="N"){
        print("********Welcome to BookStore Application**************");
        break;
      }
    }
  }

}