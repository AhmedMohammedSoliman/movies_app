import 'package:flutter/cupertino.dart';
import 'package:movies_app/home_navigator/newRealease_widget_navigator.dart';
import '../FireBaseModel/FireBaseModel.dart';
import '../fireBaseFun/fireBase_fun.dart';

class NewRealeaseWidgetViewModel extends ChangeNotifier{
  late NewRealeaseWidgetNavigator navigator ;

  void addMovieToFavourite (String title , String image , String date , String lan) async{
    FavouriteModel movie = FavouriteModel(
        title: title,
        image: image,
        date: date,
        lan: lan ,
    );
    try{
      var movieObject = await FireBaseFun.addMovieToFireBase(movie);
      print("ok");
    }catch(e){
      rethrow ;
    }
  }
}