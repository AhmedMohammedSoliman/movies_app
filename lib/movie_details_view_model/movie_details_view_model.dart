import 'package:flutter/cupertino.dart';
import '../FireBaseModel/FireBaseModel.dart';
import '../fireBaseFun/fireBase_fun.dart';
import '../movie_details_navigator/movie_details_navigator.dart';

class MovieDetailsViewModel extends ChangeNotifier{

  late MovieDetailsNavigator navigator ;
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