import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/TopRatedModel.dart';
import 'package:movies_app/movie_details/similarListScreen_top_rated.dart';
import 'package:movies_app/movie_details_view_model/movie_details_top_rated_view_model.dart';
import 'package:movies_app/watchList/watchListScreen.dart';
import 'package:provider/provider.dart';

import '../movie_details_navigator/movie_details_top_rated_navigator.dart';
class MovieDetailsScreenTopRated extends StatefulWidget{
  static const String routeName = "detailsTop";

  @override
  State<MovieDetailsScreenTopRated> createState() => _MovieDetailsScreenTopRatedState();
}

class _MovieDetailsScreenTopRatedState extends State<MovieDetailsScreenTopRated> implements MovieDetailsTopRatedNavigator{

  MovieDetailsTopRatedViewModel viewModel = MovieDetailsTopRatedViewModel();
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Map ;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(args["title"], style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
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
                                   navigatorToFavourite();
                                   addMovie(args["results"]);
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
                  padding: const EdgeInsets.only(left: 10 , top: 5 , bottom: 5),
                  child: Text("More like this" , style: TextStyle(color: Colors.white ,
                      fontWeight: FontWeight.bold , fontSize: 20)),
                ),
                SimilarListScreenTopRated(results: args["results"])
              ]
          )
      ),
    );
  }

  @override
  void navigatorToFavourite() {
    Navigator.pushNamed(context, WatchListScreen.routeName);
  }

  void addMovie(ResultsTopRated resultsTopRated) {
    viewModel.addMovieToFavourite(
        resultsTopRated.title ?? "",
        resultsTopRated.posterPath ?? "",
        resultsTopRated.releaseDate ?? "",
        resultsTopRated.originalLanguage ?? "");
  }
}