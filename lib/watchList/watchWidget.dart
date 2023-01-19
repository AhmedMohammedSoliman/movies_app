import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/watchList/watch_widget_navigator.dart';
import 'package:movies_app/watchList/watch_widget_view_model.dart';
import 'package:provider/provider.dart';

class WatchItem extends StatefulWidget{

  String image ;
  String title ;
  String date ;
  String lan ;

  WatchItem({required this.title , required this.image , required this.date , required this.lan});

  @override
  State<WatchItem> createState() => _WatchItemState();
}

class _WatchItemState extends State<WatchItem> implements WatchWidgetNavigator{

  WatchWidgetViewModel  viewModel = WatchWidgetViewModel() ;
  @override
  void initState() {
    viewModel.navigator = this ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Stack(
                  children: [
                    Image(image: NetworkImage(widget.image) , width: 100, height: 150,),
                    CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: IconButton(onPressed: (){
                        viewModel.deleteMovieFromFireBaseFun();
                        print("delete");
                      }, icon: Icon(Icons.check , color: Colors.white,)),
                    )
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.play_arrow , color: Colors.black,),
                )
              ],
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                children: [
                  Text(widget.title , maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white),) ,
                  Text(widget.date, style: TextStyle(color: Colors.grey)) ,
                  Text(widget.lan, style: TextStyle(color: Colors.white))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}