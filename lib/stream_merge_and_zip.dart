import 'dart:async';
import 'package:async/async.dart'; //StreamGroup
void main() async{
  Stream<int> numberStream = Stream.fromIterable([1,2,3,4,5,6,7,8,9,10]);
  Stream<int> numberStreamTwo = Stream.fromIterable([11,12,13,14,15,16,17,18,19]);

  //Random order
  StreamGroup.merge([numberStream,numberStreamTwo]).listen((number) {
    //print("Merge Test => " + number.toString() );
  });

  StreamZip([numberStream,numberStreamTwo]).listen((numberList) {
    print(numberList);
  });
}