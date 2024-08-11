import 'dart:io';

main(){
  print("Enter your first name:");
  String? firstName = stdin.readLineSync()!;
  print("Enter your last name:");
  String? lastName = stdin.readLineSync()!;

  List reversName = [firstName, lastName];
  print(reversName.reversed.join(' '));
}