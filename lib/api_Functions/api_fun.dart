import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/model/CategoryModel.dart';
import 'package:movies_app/model/PopularModel.dart';
import 'package:movies_app/model/TopRatedModel.dart';

import '../model/CategoryFilteredListModel.dart';

class ApiFun {

  static const String baseURL = "api.themoviedb.org";
  //https://api.themoviedb.org/3/movie/popular?api_key=0f0542083e9ac60244dac6c8fc27ec2f&language=en-US&page=1
 static Future<PopularModel> getPopularList()async{
    var url = Uri.https(baseURL, "/3/movie/popular" , {
      "api_key" : "0f0542083e9ac60244dac6c8fc27ec2f" ,
      "language" : "en" ,
      "page" : "1"
    });

   try {
     var response =await http.get(url);
     var body = response.body ;
     var json = jsonDecode(body) ;
     var popularModel = PopularModel.fromJson(json);
     return popularModel ;

   }catch (e){
     print(e);
     rethrow ;
   }
  }
  
  static Future<TopRatedModel> getRecommendedList ()async{
    // https://api.themoviedb.org/3/movie/top_rated?api_key=0f0542083e9ac60244dac6c8fc27ec2f&language=en-US&page=1
   var url = Uri.https(baseURL, "/3/movie/top_rated" , {
     "api_key" : "0f0542083e9ac60244dac6c8fc27ec2f" ,
     "language" : "en" ,
     "page" : "1"
   });
    try {
      var response = await http.get(url);
      var body = response.body ;
      var json = jsonDecode(body) ;
      var topRatedModel = TopRatedModel.fromJson(json);
      return topRatedModel ;
    }catch (e){
      rethrow ;
    }
   }

   static Future<CategoryModel> getCategoryList ()async{
   // https://api.themoviedb.org/3/genre/movie/list?api_key=0f0542083e9ac60244dac6c8fc27ec2f&language=en-US
     var url = Uri.https(baseURL, "/3/genre/movie/list" , {
       "api_key" : "0f0542083e9ac60244dac6c8fc27ec2f" ,
       "language" : "en-US"
     });
     try {
       var response = await http.get(url);
       var body = response.body ;
       var json = jsonDecode(body) ;
       var categoryModel = CategoryModel.fromJson(json);
       return categoryModel ;
     }catch (e){
       rethrow ;
     }
   }

   static Future<CategoryFilteredListModel> getCategoryFilterList ()async{
   // https://api.themoviedb.org/3/discover/movie?
     // api_key=0f0542083e9ac60244dac6c8fc27ec2f&language=en-US&
     // sort_by=popularity.desc&include_adult=false&
     // include_video=false&page=1&with_watch_monetization_types=flatrate
     var url = Uri.https(baseURL, "/3/discover/movie" , {
       "api_key" : "0f0542083e9ac60244dac6c8fc27ec2f" ,
       "language" : "en-US" ,
       "sort_by" :"popularity.desc" ,
       "include_adult" : "false" ,
       "include_video" : "false" ,
       "page" : "1" ,
       "with_watch_monetization_types" : "flatrate"
     });
     try {
       var response = await http.get(url);
       var body = response.body ;
       var json = jsonDecode(body) ;
       var categoryFilteredModel = CategoryFilteredListModel.fromJson(json);
       return categoryFilteredModel ;
     }catch (e){
       rethrow ;
     }
   }

}