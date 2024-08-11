import 'dart:io';

main(){
  Map<String,dynamic> myMap ={
    "name": "Fatima",
    "phone": 731234556,
  };
  var keysWithFourLength = [];
  for (var i in myMap.keys){
    if(i.length==4){
      keysWithFourLength.add(i);
    }
  }

  print("The keys with 4 length are $keysWithFourLength");
}