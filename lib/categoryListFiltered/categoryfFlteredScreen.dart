import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryFilteredWidget extends StatelessWidget{

  String image ;
  String title ;
  String date ;
  String lan ;

  CategoryFilteredWidget({required this.image , required this.date , required this.title , required this.lan});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image(image: NetworkImage(image) , width:  100, height: 150,) ,
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.play_arrow , color: Colors.black, size: 30,),
              )
            ],
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              children: [
                Text(title , maxLines: 6,overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold
                ,),) ,
                SizedBox(width: 10,),
                Text(date , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold
                  ,),) ,
                SizedBox(width: 10,),
                Text(lan , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold
                  ,),) ,
              ],
            ),
          )
        ],
      ),
    );
  }
}