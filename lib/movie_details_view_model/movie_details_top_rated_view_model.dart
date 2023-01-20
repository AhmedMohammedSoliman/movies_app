import 'package:flutter/cupertino.dart';
import 'package:movies_app/movie_details_navigator/movie_details_top_rated_navigator.dart';

import '../FireBaseModel/FireBaseModel.dart';
import '../fireBaseFun/fireBase_fun.dart';

class MovieDetailsTopRatedViewModel extends ChangeNotifier{
   late MovieDetailsTopRatedNavigator navigator ;
   void addMovieToFavourite (String title , String image , String date , String lan) async{
      FavouriteModel movie = FavouriteModel(
          title: title,
          image: image,
          date: date,
          lan: lan);
      try{
         var movieObject = await FireBaseFun.addMovieToFireBase(movie);
         print("ok");
      }catch(e){
         rethrow ;
      }
   }

}