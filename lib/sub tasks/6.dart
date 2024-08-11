import 'dart:io';
import 'dart:math';

main(){
  var guessNum = Random().nextInt(100);
  print("Enter the radius of the circle :");

  int? radius = int.parse(stdin.readLineSync()!);
  print("The area of the circle equal ${3.14 * radius * radius}");
}