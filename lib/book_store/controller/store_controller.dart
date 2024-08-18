import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:training_works/book_store/components/book_detail.dart';
import '../model/book_model.dart';

class StoreController {
  List<BooksData> _booksList = [];
  List<BooksData> _cart = [];
  double total = 0;
  double _userBalance = 100.0;

  Future getData() async {
    final String res = await rootBundle.loadString("assets/bookData.json");
    final data = await json.decode(res);
    _booksList.addAll(data.map((b) => BooksData.fromJson(b)).toList());
  }

  List<BooksData> get booksList => _booksList;
  double get userBalance => _userBalance;
  List<BooksData> get cart => _cart;

// ----------- 1) View Books
  void viewBooks(){
  for(var i in _booksList){
    bookDetail(i.name!, i.id!, i.author!, i.category!, i.price!, i.quantity!, i.status!);
  }
}

// ----------- 2) add book
  void addBook(){
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
    int id = (_booksList[_booksList.length-1].id)! + 1;

    Map newBook = {
      "id" : id,
      "name" : name,
      "author" : author,
      "category" : category.split(','),
      "price" : price,
      "quantity" : quantity
    };
    for(var i in _booksList){
      if(i.name==newBook["name"]){
        print("Book name exist before, Try Again");
        continue;
      }
      else{
        _booksList.add(i);
        print("Successfully Added, Books Now : ${_booksList.length}");
        break;
      }
    }
  }


  // ----------- 3) remove Book
  void removeBook(){
    print("Enter Book Number / ID : ");
    int? id = int.parse(stdin.readLineSync()!);

    for(int i=0; i<_booksList.length;i++){
      if(_booksList[i].id==id){
        _booksList.removeAt(i);
        print( "Successfully Removed, remaining Books : ${booksList.length}");
        break;
      }
    }
  }

  // ----------- 4) search Books
  void searchBooks() {
    print('Enter Your Search Word (Name / Category) : ');
    final query = stdin.readLineSync();
    final matchingBooks = _booksList.where((book) => book.name!.contains(query!) || book.category!.any((cat) => cat.contains(query))).toList();
    for (final book in matchingBooks) {
      print('[ Book ${book.id} ] (${book.id}) -- Author : ${book.author}, Quantity : ${book.quantity}, Price : \$${book.price}, Category : ${book.category}, status : ${book.quantity! > 0? "Available":"Sold Out"}');
    }
  }



  // ----------- 5) Add books to shopping cart
  void addBooksToCart(){
    while (true){
      print("Add Book to the cart by it's id");
      print("Enter Book id to add it to the cart :");
      int? id = int.parse(stdin.readLineSync()!);
      bool exist = false;

      if(_cart.length<3){

        final book = _booksList.firstWhere((b) => b.id == id, orElse: () => BooksData(id: -1, name: '', author: '', quantity: 0, price: 0, category: [], status: ''));
        if (book.id != -1) {
          _cart.add(book);
          exist = true;
          total = total + (book.price!) ;
          print( "Until Now You have ${_cart.length} book the cart is :$total");
          break;
        } else {
          print('Book not found');
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


  // ----------- 6) Manage Shopping Cart
  void manageCart(){
    if(_cart.isEmpty){
      print( "Your Cart is Empty");
    }
    else{
      for(int i=0; i<_booksList.length;i++){
        print("Your Cart Contains 3 Items :\n $i. ");
        bookDetail(_booksList[i].name!, _booksList[i].id!, _booksList[i].author!, _booksList[i].category!, _booksList[i].price!, _booksList[i].quantity!, _booksList[i].status!);

        print("Do you want to remove item from cart (Y/N) ?");
        String? ans = stdin.readLineSync()!;
        if(ans=="Y"){
          print("Enter Book Numbers you want to remove separated by commas :");
          String? numbers = stdin.readLineSync()!;
          List numList = numbers.split(',');
          for(int i in numList){
            _cart.removeAt(i);
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
// ----------- 7) Confirm payment
  confirmPayment(){
    if(_cart.isEmpty){
      print( "Your Cart is Empty Now");
    }
    else{
      print( "Your Payment Succeeded , Your balance now $total");
    }
  }

  // ----------- 9) Display one book details
  void disblayOneBook(){
    print("Enter Book Number / ID :");
    String? id = stdin.readLineSync()!;

    for(int i=0; i<_booksList.length;i++){
      if(_booksList[i].id==id){
        bookDetail(_booksList[i].name!, _booksList[i].id!, _booksList[i].author!, _booksList[i].category!, _booksList[i].price!, _booksList[i].quantity!, _booksList[i].status!);
        break;
      }
    }
  }

}