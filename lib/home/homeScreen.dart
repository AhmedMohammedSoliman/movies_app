import 'package:flutter/material.dart';
import 'package:movies_app/home/popularCall.dart';
import 'package:movies_app/home/topRatedCall.dart';

import 'newRealeasesCall.dart';

class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PopularCall(),
          SizedBox(height: 7,),
          Text("New Realeases" ,
            style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.start,),
          SizedBox(height: 7,),
          NewRealeaseCall(),
          SizedBox(height: 7,),
          Text("Recommended" ,
            style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.start,),
          SizedBox(height: 7,),
          TopRatedCall(),
        ],
      ),
    );
  }
}