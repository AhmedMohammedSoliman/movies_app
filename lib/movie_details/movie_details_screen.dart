import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MovieDetailsScreen extends StatelessWidget{
  static const String routeName = "details";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Map ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(args["title"] , style: TextStyle(color: Colors.white  , fontSize: 20 , fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image(image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500/${args["image"]}'
              )
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.play_arrow , color: Colors.black, size: 30,),
              )
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(args["title"], style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(args["date"], style: TextStyle(color: Colors.grey , fontSize: 18 , fontWeight: FontWeight.bold),),
          ),
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Row(
             children: [
               Stack(
                 alignment: Alignment.topLeft,
                 children: [
                   Image(image: NetworkImage(
                       'https://image.tmdb.org/t/p/w500/${args["poster"]}'
                   ) , width: 100, height:  150,),
                   CircleAvatar(
                     backgroundColor: Color(0xff514F4F),
                     child: IconButton(
                         onPressed: (){
                           
                         },
                         icon: Icon(Icons.add , color: Colors.white, size: 20,)),
                   )
                 ],
               ) ,
               SizedBox(width: 10,),
               Expanded(
                 child: Column(
                   children: [
                   Text(args["description"] , style: TextStyle(color: Colors.white , fontSize: 15 , fontWeight: FontWeight.bold) ,
                 maxLines: 6, overflow: TextOverflow.ellipsis,),
                     SizedBox(height: 10,),
                     Row(
                       children: [
                         Icon(Icons.star , color: Colors.yellow,),
                         Text("${args["rate"]}" , style: TextStyle(color: Colors.white),)
                       ],
                     )
                   ],
                 ),
               )
        ],
      ),
         ),
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Text("More like this" , style: TextStyle(color: Colors.white ,
           fontWeight: FontWeight.bold , fontSize: 20)),
         ),
        ]
    )
    );
  }
}
 // https://api.themoviedb.org/3/movie/{movie_id}/similar?api_key=<<api_key>>&language=en-US&page=1
// 315162