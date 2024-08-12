import 'dart:io';
import '../book_data_list.dart';
import 'cart_list.dart';

addBookToCart(){
  while (true){
    print("Add Book to the cart by it's id");
    print("Enter Book id to add it to the cart :");
    int? id = int.parse(stdin.readLineSync()!);

    bool exist = false;

    if(cartList.length<3){
      for(int i=0; i<bookData.length;i++){
        if(bookData[i]['id']==id){
          cartList.add(id);
          exist = true;
          total = total + (bookData[i]['price']) ;
          print( "Until Now You have ${cartList.length} book the cart is :$total");

          break;
        }
      }
      if (exist==false) { print("book doesn't exist");}
      print("Do you want to add another item (Y/N) ? ");
      String? ans = stdin.readLineSync()!;
      if(ans=="Y"){
        continue;
      }
      else if (ans=="N"){
        print("********Welcome to BookStore Application**************");
        break;
      }
    }
    else{
      print("Cart limit exceeded, You can't add more");
      break;
    }


  }
}



