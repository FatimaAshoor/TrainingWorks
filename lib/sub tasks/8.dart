import 'dart:io';

main(){

  print("Enter the file name");
  String? fileName = stdin.readLineSync()!;

  print("${fileName.split('.').last}");


}