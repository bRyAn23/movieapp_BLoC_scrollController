void main() async
{
  Stream<int> numbersStream = Stream.fromIterable([1,2,3,4,5,6,7,8,9,10]);

  ///Filtering Operators
  //Where
  numbersStream.where((number) =>
    number%2 == 0
  ).listen((resultNum) {
    //print(resultNum);
  });

  //First Where (return future)
  numbersStream.firstWhere((element) =>
  element%2 == 0
  ).then((value) => print("First Where ==> " + value.toString()));

  //Last Where
  numbersStream.lastWhere((element) => element%2 ==0)
  .then((value) => print("Last Where ==> " + value.toString()));

  ///Conditional Operators
  //Take
  print("take Operator");
  numbersStream.take(5).listen((number) {
    //print(number);
  });

  //Take While
  numbersStream.takeWhile((element) => element<5).listen((number) {
    //print("take while =>" + number.toString());
  });

  //Skip
 numbersStream.skip(5).listen((number) {
   //print("SKIP =>" + number.toString());
 });

  //Skip While
  numbersStream.skipWhile((element) => element<5).listen((number) {
    print("Skip while => " + number.toString());
  });

  ///Transformation Operator
  //Map
  numbersStream.map((number) => number*2).listen((number) {
    print("Map => " + number.toString());
  });


  //Async Expand
  Stream<List<int>> numberListStream = Stream.value([1,2,3,4,5,6,7,8,9,10]);
  numberListStream
      .asyncExpand((numberList) =>
      // Change to emit one by one value
      Stream.fromIterable(numberList))
      .where((number) => number%2 == 0)
      .map((number) => number*2)
      .listen((number) => print("Async Expand => " + number.toString()));

  ///Operator that product a Single Value
  //Join(return future)
  numbersStream.join(",")
      .then((joinedString) => print("Join Operator =>" + joinedString));

  //Reduce(return future)
  numbersStream.reduce((previous, element) => previous + element).then((value) =>
  print("Reduce : " + value.toString()));

  //toList(return future) => use to change single value
  numbersStream.toList().then((value) => print(value));

  //toSet(return future) => use to change single value
  numbersStream.toSet().then((value) => print(value));

}