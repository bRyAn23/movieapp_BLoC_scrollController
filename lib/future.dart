// Future DataType
Future<void> main() async{
  //Future with String
 Future<String> nameFuture = Future.value("PADC");
 nameFuture.then((name)=> print(name));

 //Future with other datatype
 Future<List<int>> numberListFuture = Future.value([1,2,3,4,5,6,7,8,9,10]);
 numberListFuture.then((numberList)=> print(numberList.toString()));

 //Future with error
 Future<String> errorFuture = Future.error(NullThrownError());
 errorFuture.then((value){
   print(value);
 }).catchError((error){
   print(error);
 });

 //Future with delay
 // Future<String> delayedNameFuture = Future.delayed(Duration(milliseconds: 700),
 //         ()=> "Zeyar Wint");
 // delayedNameFuture.then((value)=> print(value));

 //await block the next procedue
 Future<String> padcFuture = Future.value("PADC Myanmar");
 String padc = await padcFuture;
 print(padc);


 //Future with delay
 // Future<String> delayedNameFuture = Future.delayed(Duration(milliseconds: 3000),
 //         ()=> "Zeyar Wint");
 // delayedNameFuture.then((value)=> print(value));

  Future<String> threeSecondFuture = Future.delayed(Duration(seconds: 3),
              ()=> "3 seconds future");
 // String threeSecondFutureValue = await threeSecondFuture;
 // print(threeSecondFutureValue);
 //threeSecondFuture.then((value)=> print(value));

  Future<String> twoSecondFuture = Future.delayed(Duration(seconds: 2),
      ()=> "2 seconds future");
 //twoSecondFuture.then((value)=> print(value));
 // String twoSecondFutureValue = await twoSecondFuture;
 //  print(twoSecondFutureValue);


 Future<String> oneSecondFuture = Future.delayed(Duration(seconds: 1),
         ()=> "1 seconds future");
 //oneSecondFuture.then((value)=> print(value));
 // String oneSecondFutureValue = await oneSecondFuture;
 // print(oneSecondFutureValue);

 //Paralle process with async await
 print(await threeSecondFuture);
 print(await twoSecondFuture);
 print(await oneSecondFuture);

 //Catch error for await
 Future<String> errorFuture_Await = Future.error(NullThrownError());
  try{
    String value = await errorFuture_Await;
  }catch(error){
  print(error.toString());
    }
 //print("Future have finished");
}