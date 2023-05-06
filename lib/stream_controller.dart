import 'dart:async';

void main() async{
  StreamController<List<int>> numberStreamController = StreamController();

  ///Widgets (at page level code) (output)
  numberStreamController.stream.listen((numberList) => print(numberList));

  ///input data to controller (input)
  ///blocs(Business Logic components)
  numberStreamController.sink.add([1,2,3,4,5]);
  numberStreamController.sink.add([6,7,8,9,10]);

  ///To dispose stream controller
  //Stream need to close at widget level
  //because of memory leak. Stream is alive even widget is disposed.
  numberStreamController.close();
}