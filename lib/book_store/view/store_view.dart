import 'dart:io';
import 'package:training_works/book_store/controller/store_controller.dart';


main() {
  final controller = StoreController();
  controller.getData();

  print('''
  ******** Welcome to BookStore Application **************
  1. View Books
  2. Add Book
  3. Remove Book
  4. Search Books
  5. Add To Shopping Cart
  6. Manage Shopping Cart
  7. Confirm Payment
  8. Check Your Balance
  9. Get Details of One book
  q. Exit
  *********************************************
  Enter your choice:
      ''');

  String? c = stdin.readLineSync()!;

  switch (c) {
    case "1":
      controller.viewBooks();
    case "2":
      controller.addBook();
    case "3":
      controller.removeBook();
    case "4":
       controller.searchBooks();
    case "5":
       controller.addBooksToCart();
    case "6":
       controller.manageCart();
    case "7":
       controller.confirmPayment();
    case "8":
      controller.userBalance;
    case "9":
      controller.disblayOneBook();
    case "q":
      print("Exit");
  }
}
