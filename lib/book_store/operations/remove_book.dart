
import 'dart:io';

import '../book_data_list.dart';

removeBook(){
  print("Enter Book Number / ID : ");
  int? id = int.parse(stdin.readLineSync()!);

  for(int i=0; i<bookData.length;i++){
    if(bookData[i]['id']==id){
      bookData.removeAt(i);
      print( "Successfully Removed, remaining Books : ${bookData.length}");
      break;
    }
  }
}