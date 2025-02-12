void main(){
  // Filter Even Numbers
  // Write a function that filters all even numbers from a list of integers.
  // Input: [1, 2, 3, 4, 5, 6]
  // Output: [2, 4, 6]

  filters();

}


  void filters(){
    var evenNo = [1,2,3,4,5,6];
    var evenNumbers = [];
    for(var number in evenNo){
      if(number % 2 == 0){
        evenNumbers.add(number);
      }
    }
    print(evenNumbers);
  }