void main() async{
  Stream<int> numberStream = Stream.fromIterable([1,2,3,4,5,6,7,8,9,10])
  .asBroadcastStream();
  numberStream.listen((number) {
    print(number);
  });
 //Multiple stream listen to use asBroadcastStream
  numberStream.listen((number) {
    print("This is add 1 => " + (number + 1).toString());
  });
  Stream<List<int>> numberListStream = Stream.value([1,2,3,4,5,6,7,8,9,10]);
  numberListStream.listen((numbers) {
    print(numbers);
  });

  Stream<int> numberOnlyStream = Stream.value(1);
  numberOnlyStream.listen((number) {
    print("Test with .value => " + number.toString());
  });

  Stream<int> errorStream = Stream.error(NullThrownError());
  errorStream.listen((number) {
    print(number);
  }).onError((error) {
    print(error);
  });
}