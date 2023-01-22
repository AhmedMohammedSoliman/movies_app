import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/FireBaseModel/FireBaseModel.dart';
import 'package:movies_app/fireBaseFun/fireBase_fun.dart';
import 'package:movies_app/watchList/watchWidget.dart';

class WatchListScreen extends StatelessWidget{

  static const String routeName = "favourite" ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  StreamBuilder<QuerySnapshot<FavouriteModel>>(
          stream: FireBaseFun.getMoviesFromFireBase(),
            builder: (context , asyncSnapShot){
                  if (asyncSnapShot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(),);
                     }else if (asyncSnapShot.hasError){
                  return Column(
                     children: [
                Text(asyncSnapShot.error.toString() , style: TextStyle(color: Colors.white),) ,
                  ElevatedButton(
                 onPressed: (){
                   FireBaseFun.getMoviesFromFireBase();
                     },
                   child: Text("Try again"))
                   ],
                  );
                      }else {
                    // date
                    print("done");
                    var moviesList = asyncSnapShot.data?.docs.map((doc) => doc.data()).toList() ?? [];
                    return moviesList.length == 0 ? Center(child: Text("There is no watch list yet" ,
                    style: TextStyle(color: Colors.white , fontSize: 20),),) : ListView.separated(
                      separatorBuilder: (context , index) => Divider(color: Colors.white,),
                        itemCount: moviesList.length ,
                        itemBuilder: (context , index) => WatchItem(
                            title: moviesList[index].title ,
                            image: 'https://image.tmdb.org/t/p/w500/${moviesList[index].image}',
                            date: moviesList[index].date ,
                            lan: moviesList[index].lan,
                            movie: moviesList[index],
                            ));
                  }
            }),
      ),
    );
  }

}