import 'package:flutter/material.dart';
import 'package:movies_app/FireBaseModel/FireBaseModel.dart';
import 'package:movies_app/fireBaseFun/fireBase_fun.dart';
import 'package:movies_app/watchList/watch_widget_navigator.dart';

class WatchWidgetViewModel extends ChangeNotifier{
  late WatchWidgetNavigator navigator ;

  void deleteMovieFromFireBaseFun (String title , String image , String date , String lan , String id)async{
    FavouriteModel movie = FavouriteModel(title: title, image: image, date: date, lan: lan);
   try{
    var movieObject = await FireBaseFun.deleteMovieFromFireBase(id) ;
    print ("its done");
   }catch(e){
     print("failed");
     rethrow ;
   }
  }
}