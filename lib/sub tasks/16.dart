import 'dart:io';

main(){
  print("Enter your word:");
  String? word = stdin.readLineSync()!;
  List wordList = word.split("");
  Map countMap = {};
  wordList.forEach((i) => countMap[i] = !countMap.containsKey(i) ? (1) : (countMap[i] + 1));
  print(countMap);
}