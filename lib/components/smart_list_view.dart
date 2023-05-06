import 'package:flutter/material.dart';

class SmartHorizontalListView extends StatefulWidget{
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final EdgeInsets padding;
  final Function onListEndReached;
  SmartHorizontalListView({
    required this.itemCount,
    required this.itemBuilder,
    required this.padding,
    required this.onListEndReached,
});
  @override
  _SmartHorizontalListViewState createState() =>
      _SmartHorizontalListViewState();
}

class _SmartHorizontalListViewState extends State<SmartHorizontalListView>{
  var _scrollController = ScrollController();
  //must be state widget because to use scroll listener call back add listener
  // add listener call back declare at initState
  @override
  void initState(){
    super.initState();

    _scrollController.addListener(() {

      if(_scrollController.position.atEdge){
        if(_scrollController.position.pixels==0){
          print("Start Of the list reached");
        }else {
          print("End Of the list reached");
          widget.onListEndReached();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          padding: this.widget.padding,
          itemCount: this.widget.itemCount,
          itemBuilder: this.widget.itemBuilder
      ),
    );
  }
}