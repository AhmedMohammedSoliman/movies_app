import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget{

  String image ;
  String title ;
  String date ;
  String lan ;

  SearchWidget({required this.image , required this.date , required this.title , required this.lan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Image(image: NetworkImage(image) , width:  100, height: 150,) ,
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