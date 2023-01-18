import 'package:flutter/material.dart';

class NewRealeaseWidget extends StatelessWidget{
   String image ;
   NewRealeaseWidget({required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Image(image: NetworkImage(image) , fit: BoxFit.fill),
          CircleAvatar(
            backgroundColor: Color(0xff514F4F),
            child: IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.add , color: Colors.white, size: 20,)),
          )
        ],
      ),
    );
  }
}