import 'dart:io';
import 'package:training_works/book_store/cart/add_book_to_cart.dart';
import 'package:training_works/book_store/cart/confirm_payment.dart';
import 'package:training_works/book_store/cart/manage_cart.dart';
import 'package:training_works/book_store/operations/add_book.dart';
import 'package:training_works/book_store/operations/remove_book.dart';
import 'package:training_works/book_store/operations/search_book.dart';
import 'package:training_works/book_store/operations/view_books.dart';
import 'cart/display_one_book.dart';
import 'cart/show_balance.dart';

main(){
  print("******** Welcome to BookStore Application **************\n1. View Books\n2. Add Book\n3. Remove Book\n4. Search Books\n5. Add To Shopping Cart\n6. Manage Shopping Cart\n7. Confirm Payment\n8. Check Your Balance\n9. Get Details of One book\nq. Exit\n*********************************************");
  String? c = stdin.readLineSync()!;

  switch(c){
    case "1":
      return viewBooks();
    case "2":
      return addBook();
    case "3":
      return removeBook();
    case "4":
      return searchBook();
    case "5":
      return addBookToCart();
    case "6":
      return manageCart();
    case "7":
      return confirmPayment();
    case "8":
      return showBalance();
    case "9":
      return disblayOneBook();
    case "q":
      print("Exit");
  }

}