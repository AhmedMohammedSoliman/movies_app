import 'package:flutter/cupertino.dart';
import 'package:movies_app/FireBaseModel/FireBaseModel.dart';
import 'package:movies_app/fireBaseFun/fireBase_fun.dart';

import '../home_navigator/top_rated_navigator.dart';

class TopRatedViewModel extends ChangeNotifier{

  late TopRatedNavigator navigator ;

  void addMovieToFireBase (String title , String image , String date , String originTitle)async{
    try{
      FavouriteModel movie = FavouriteModel(
          title: title,
          image: image,
          date: date,
          originTitle: originTitle);
    var movieObject =  await FireBaseFun.addMovieToFireBase(movie);
    }catch(e){
      rethrow ;
    }
  }
}