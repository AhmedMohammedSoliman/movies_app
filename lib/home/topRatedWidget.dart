import 'package:flutter/material.dart';

class TopRatedWidget extends StatelessWidget {
  String image ;
  String title ;
  String date ;
  double vote ;
  TopRatedWidget({required this.image , required this.title , required this.date , required this.vote});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Image(image: NetworkImage(image) , width: 100 , height: 150,) ,
                Row(
                  children: [
                    Icon(Icons.star , size: 20, color: Colors.yellow,) ,
                    Text("$vote", style: TextStyle(color: Colors.white , fontSize: 11 , fontWeight: FontWeight.bold ) ),
                  ],
                ),
                Text(title , style: TextStyle(color: Colors.white , fontSize: 11 , fontWeight: FontWeight.bold ),) ,
                Text(date , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold),),
              ],
            ),
            CircleAvatar(
              backgroundColor: Color(0xff514F4F),
              child: IconButton(
                  onPressed: (){

                  },
                  icon: Icon(Icons.add , color: Colors.white, size: 20,)),
            )
          ],
        )
      ),
    );
  }
}