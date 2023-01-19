import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimilarWidget extends StatelessWidget{

  String image ;
  double rate ;
  String title ;
  String date ;
  SimilarWidget({required this.title , required this.image , required this.rate , required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column (
          children: [
            Stack(
              children: [
                Image(image: NetworkImage(image) , width: 100, height: 150,),
                CircleAvatar(
                  backgroundColor: Color(0xff514F4F),
                  child: Icon(Icons.add , color: Colors.white, size: 20,),
                )
              ],
            ) ,
           Row(
             children: [
               Icon(Icons.star , color: Colors.yellow,),
               Text("$rate" , style: TextStyle(color: Colors.white),) ,
             ],
           ),
            Text(title , style: TextStyle(color: Colors.white),) ,
            Text(date , style: TextStyle(color: Colors.grey),) ,
          ],
        ),
      ),
    );
  }
}