import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api_Functions/api_fun.dart';
import 'package:movies_app/home/newRealeaseWidget.dart';
import 'package:movies_app/home_navigator/newRealeased_navigator.dart';
import 'package:movies_app/home_view_model/newRealesed_view_model.dart';
import 'package:movies_app/model/PopularModel.dart';
import 'package:provider/provider.dart';

import '../movie_details/movie_details_screen.dart';

class NewRealeaseCall extends StatefulWidget{

  @override
  State<NewRealeaseCall> createState() => _NewRealeaseCallState();
}

class _NewRealeaseCallState extends State<NewRealeaseCall> implements NewRealeasedNavigator{

  NewRealeasedViewModel viewModel = NewRealeasedViewModel();

  @override
  void initState() {
    viewModel.navigator = this ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: FutureBuilder<PopularModel>(
        future: ApiFun.getPopularList(),
          builder: (context , asyncSnapShot) {
            if (asyncSnapShot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            } else if (asyncSnapShot.hasError) {
              return Column(
                children: [
                  Text(asyncSnapShot.error.toString() , style: TextStyle(color: Colors.white),),
                  ElevatedButton(
                      onPressed: () {
                        ApiFun.getPopularList();
                      },
                      child: Text("Try again"))
                ],
              );
            } else {
              //data
              var newRealeaseList = asyncSnapShot.data?.results ?? [];
              return Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index) => InkWell(
                      onTap: (){
                        navigateToMovieDetails(newRealeaseList[index]);
                      },
                      child: NewRealeaseWidget(image:
                      'https://image.tmdb.org/t/p/w500/${newRealeaseList[index].posterPath}',
                        results: newRealeaseList[index],
                        ),
                    ),
                    separatorBuilder: (context , index) => SizedBox(width: 10,),
                    itemCount: newRealeaseList.length),
              );
            }
          }


      ),
    );
  }

  @override
  void navigateToMovieDetails(Results results) {
    Navigator.pushNamed(context, MovieDetailsScreen.routeName , arguments: {
      "title" : results.title ,
      "image" : results.backdropPath,
      "poster" : results.posterPath ,
      "rate" : results.voteAverage ,
      "date" : results.releaseDate ,
      "description" : results.overview ,
      "results" : results
    });
  }
}