import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/SearchModel.dart';
import 'package:movies_app/movie_details/similarWidget.dart';

import '../api_Functions/api_fun.dart';
import '../model/SimilarModel.dart';

class SimilarListScreenSearch extends StatelessWidget{

  SearchResults results ;
  SimilarListScreenSearch({required this.results});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SimilarModel>(
        future: ApiFun.getSimilarListSearch(results),
        builder: (context , asyncSnapShot) {
          if (asyncSnapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }else if (asyncSnapShot.hasError){
            return Column(
              children: [
                Text(asyncSnapShot.error.toString() , style: TextStyle(color: Colors.white),) ,
                ElevatedButton(
                    onPressed: (){
                      ApiFun.getSimilarListSearch(results);
                    },
                    child: Text("Try again"))
              ],
            );
          }else {
            //data
            var similarList = asyncSnapShot.data?.results ?? [];
            return Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index) => SimilarWidget(
                        title: similarList[index].title ?? "",
                        image: 'https://image.tmdb.org/t/p/w500/${similarList[index].posterPath}',
                        rate: similarList[index].voteAverage ?? 0 ,
                        date: similarList[index].releaseDate ?? ""),
                    separatorBuilder: (context , index) => SizedBox(width: 5,),
                    itemCount: similarList.length));
          }
        });
  }
}