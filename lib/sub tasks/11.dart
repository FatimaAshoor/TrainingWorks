import 'dart:io';

main(){
  print("Enter Your letter:");
  String? letter = stdin.readLineSync()!;

  if(letter.length>1){
    return "Enter one letter only";
  }
  else{
    if(letter == "a" || letter == "e" || letter == "i" || letter == "u" || letter == "o"){
      print("The $letter is a vowel letter");
    }
    else {
      print("The $letter is not a vowel letter") ;
    }
  }
}