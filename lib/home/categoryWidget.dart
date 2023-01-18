import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget{
  String title ;
  String image ;
  CategoryWidget({required this.title , required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30)
      ),

      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image(image: AssetImage(image), fit: BoxFit.cover, height: double.infinity, width: double.infinity,) ,
          Container(
            padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text(title , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }
}