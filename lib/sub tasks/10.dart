main(){
  List myList = [10,2,3,0,5,4,3,6,4,8,9,4];
  int counter= 0;
  for(int i in myList){
    if(i==4){
      counter++;
    }
  }
  print("The count of the 4 number = $counter");
}