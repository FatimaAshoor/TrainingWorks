import 'dart:io';
import 'dart:math';

main(){
  print("Enter long string :");
  String? longString = stdin.readLineSync();

  String? re = longString?.split('').reversed.join();

  print("Your string in backwards order :\n $re");

}