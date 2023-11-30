int getSmallestInteger(List<int> myList) {
  
  int smallest = myList[0];

  for (int num in myList) {
    if (num < smallest) {
      smallest = num;
    }
  }

  return smallest;
}


