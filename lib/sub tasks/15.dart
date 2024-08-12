import 'dart:io';

main(){
  print("enter number of lines:");
  int? n = int.parse(stdin.readLineSync()!);
  int num =1;
  for (int i = 0; i<n+1; i++){
    for (int j =0 ; j< i; j++){
      stdout.write("$num ");
      num++;
    }
    stdout.writeln("");
  }
}