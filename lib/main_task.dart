import 'dart:io';

main(){

  print("choose operation\n1. +\n2. -");

  String? choice = stdin.readLineSync(); // null safety in name string
  print("Your Choice : $choice");
  if (choice == "1" || choice == "2"){
    print("Enter number 1:");
    int? num1 = int.parse(stdin.readLineSync()!);
    print("Enter number 2:");
    int? num2 = int.parse(stdin.readLineSync()!);

    if (choice == "1") {
      print("sum: ${num1 + num2}");

    }
    else{
      print("difference: ${num1-num2}");
    }
  }

  else if(choice == "q"){
    print("GoodBye");
  }
  else{
    print("Error :(, choose the right option");
  }

}