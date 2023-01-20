import 'package:flutter/cupertino.dart';
import 'package:movies_app/FireBaseModel/FireBaseModel.dart';
import 'package:movies_app/fireBaseFun/fireBase_fun.dart';
import 'package:movies_app/movie_details_navigator/movie_details_search_navigator.dart';

class MovieDetailsSearchViewModel extends ChangeNotifier{
  late MovieDetailsSearchNavigator navigator ;

  void addMovieToFireBase(String title , String image , String date , String lan){
    FavouriteModel movie = FavouriteModel(title: title, image: image, date: date, lan: lan);
   try {
     var movieObject = FireBaseFun.addMovieToFireBase(movie);
     print("ok");
   }catch (e){
     rethrow ;
   }
  }
}