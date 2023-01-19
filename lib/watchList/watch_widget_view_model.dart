import 'package:flutter/material.dart';
import 'package:movies_app/fireBaseFun/fireBase_fun.dart';
import 'package:movies_app/watchList/watch_widget_navigator.dart';

class WatchWidgetViewModel extends ChangeNotifier{
  late WatchWidgetNavigator navigator ;

  void deleteMovieFromFireBaseFun ()async{
   try{
    var movieObject = await FireBaseFun.deleteMovieFromFireBase() ;

   }catch(e){
     print("failed");
     rethrow ;
   }
  }
}