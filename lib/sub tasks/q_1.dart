main(){

  var array = [4,10,2,3,5,4,3,10,6,4,8,9,100,4];
  // Function
  String largestAndMinimum(){
    var maxElement = array[0];
    var minElement = array[0];

    for (var i in array){
      if(i>maxElement){
        maxElement = i;
      }
    }

    for (var i in array){
      if(i<minElement){
        minElement = i;
      }
    }
    return "largest element = $maxElement, minimum element = $minElement";
  }

  print(largestAndMinimum());
}