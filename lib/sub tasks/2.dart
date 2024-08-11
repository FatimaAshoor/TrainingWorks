import 'dart:io';
import 'dart:math';

main(){
  var guessNum = Random().nextInt(100);
  print("The program guess $guessNum number");

  String? replay = stdin.readLineSync()!;
  if (replay=="your number"){
    print("Yeeeess");
  }
  else{
    print("Oh :(");
  }
}