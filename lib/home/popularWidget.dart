import 'package:flutter/material.dart';

class PopularWidget extends StatelessWidget{
  String image ;
  String image2 ;
  String title ;
  String date ;


  PopularWidget({required this.image , required this.image2 , required this.title ,
  required this.date});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(image: NetworkImage(image)),
            SizedBox(height: 10,),
            Text(title , style: TextStyle(color: Colors.white , fontSize: 11 , fontWeight: FontWeight.bold )
              , textAlign: TextAlign.end,),
            SizedBox(height: 10,),
            Text(date , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,),
          ],
        ),
        Image(image: NetworkImage(image2), width: 100, height:  300,)
      ],
    );
  }
}