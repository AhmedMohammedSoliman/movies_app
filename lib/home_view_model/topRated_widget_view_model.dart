import 'package:flutter/cupertino.dart';
import 'package:movies_app/home_navigator/top_rated_widget_navigator.dart';
import '../FireBaseModel/FireBaseModel.dart';
import '../fireBaseFun/fireBase_fun.dart';

class TopRatedWidgetViewModel extends ChangeNotifier {

  late TopRatedWidgetNavigator navigator ;

  void addMovieToFireBase (String title , String image , String date , String lan)async{
    try{
      FavouriteModel movie = FavouriteModel(
          title: title,
          image: image,
          date: date,
          lan: lan);
      var movieObject =  await FireBaseFun.addMovieToFireBase(movie);
      print("done");
    }catch(e){
      rethrow ;
    }
  }
}