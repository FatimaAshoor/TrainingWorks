import 'dart:io';

main(){
  print("How many number you will entered?");
  int? numbers = int.parse(stdin.readLineSync()!);
  int evenNumbers = 0;
  int counter = 0;

  for(int i = 0; i<numbers; i++){
    print("Enter number $i");
    int? number = int.parse(stdin.readLineSync()!);

    if (number%2 == 0 && evenNumbers <5){
      evenNumbers ++;
      counter += number;
    }
  }

  if(evenNumbers == 5) {
    print("The Sum of  the first 5 even integers = $counter");
  }
  else {
    print("The even integers are not 5 is equal $evenNumbers");
  }
}