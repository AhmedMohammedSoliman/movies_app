import 'package:flutter/material.dart';
import 'package:movies_app/home/topRatedWidget.dart';
import 'package:movies_app/home_navigator/top_rated_navigator.dart';
import 'package:movies_app/home_view_model/top_rated_view_model.dart';
import 'package:movies_app/model/PopularModel.dart';
import 'package:movies_app/model/TopRatedModel.dart';
import 'package:movies_app/movie_details/movie_details_screen.dart';
import 'package:provider/provider.dart';

import '../api_Functions/api_fun.dart';

class TopRatedCall extends StatefulWidget{

  @override
  State<TopRatedCall> createState() => _TopRatedCallState();
}

class _TopRatedCallState extends State<TopRatedCall> implements TopRatedNavigator {
  
  TopRatedViewModel viewModel = TopRatedViewModel();
  
  @override
  void initState() {
    viewModel.navigator = this ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return ChangeNotifierProvider(
       create: (context) => viewModel,
       child: FutureBuilder<TopRatedModel>(
           future: ApiFun.getRecommendedList(),
           builder: (context , asyncSnapShot) {
             if (asyncSnapShot.connectionState == ConnectionState.waiting) {
               return Center(child: CircularProgressIndicator(),);
             } else if (asyncSnapShot.hasError) {
               return Column(
                 children: [
                   Text(asyncSnapShot.error.toString()),
                   ElevatedButton(
                       onPressed: () {
                         ApiFun.getPopularList();
                       },
                       child: Text("Try again"))
                 ],
               );
             } else {
               //data
               var topRatedList = asyncSnapShot.data?.results ?? [];
               return Expanded(
                 child: ListView.separated(
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (context , index) => InkWell(
                       onTap: (){
                         navigateToDetails(topRatedList[index]);
                       },
                       child: TopRatedWidget(
                           image: 'https://image.tmdb.org/t/p/w500/${topRatedList[index].posterPath}',
                           title: topRatedList[index].title ?? "",
                           date: topRatedList[index].releaseDate  ?? "",
                           vote: topRatedList[index].voteAverage ?? 0),
                     ),
                     separatorBuilder: (context , index) => SizedBox(width: 10,),
                     itemCount: topRatedList.length),
               );
             }
           }
       ),
     );
  }

  @override
  void navigateToDetails(ResultsTopRated results) {
    Navigator.pushNamed(context, MovieDetailsScreen.routeName , arguments: {
      "title" : results.title ,
      "image" : results.backdropPath,
      "poster" : results.posterPath ,
      "rate" : results.voteAverage ,
      "date" : results.releaseDate ,
      "description" : results.overview ,
    });
  }

}