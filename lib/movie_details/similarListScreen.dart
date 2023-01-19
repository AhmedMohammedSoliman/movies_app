import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api_Functions/api_fun.dart';
import 'package:movies_app/model/PopularModel.dart';
import 'package:movies_app/model/SimilarModel.dart';
import 'package:movies_app/movie_details/similarWidget.dart';

class SimilarListScreen extends StatelessWidget{

  Results results ;
  SimilarListScreen({required this.results});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SimilarModel>(
        future: ApiFun.getSimilarList(results),
        builder: (context , asyncSnapShot) {
          if (asyncSnapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }else if (asyncSnapShot.hasError){
            return Column(
              children: [
                Text(asyncSnapShot.error.toString() , style: TextStyle(color: Colors.white),) ,
                ElevatedButton(
                    onPressed: (){
                      ApiFun.getSimilarList(results);
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