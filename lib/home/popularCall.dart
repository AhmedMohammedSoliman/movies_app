import 'package:flutter/material.dart';
import 'package:movies_app/api_Functions/api_fun.dart';
import 'package:movies_app/home/popularWidget.dart';
import 'package:movies_app/home_navigator/popular_navigator.dart';
import 'package:movies_app/home_view_model/popular_view_model.dart';
import 'package:movies_app/model/PopularModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/movie_details/movie_details_screen.dart';
import 'package:provider/provider.dart';
class PopularCall extends StatefulWidget{

  @override
  State<PopularCall> createState() => _PopularCallState();
}

class _PopularCallState extends State<PopularCall> implements PopularNavigator {
  PopularViewModel viewModel = PopularViewModel();

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
          }else if (asyncSnapShot.hasError){
            return Column(
              children: [
                Text(asyncSnapShot.error.toString() , style: TextStyle(color: Colors.white),) ,
                ElevatedButton(
                    onPressed: (){
                      ApiFun.getPopularList() ;
                    },
                    child: Text("Try again"))
              ],
            );
          }else {
            //data
            var popularList = asyncSnapShot.data?.results ?? [];
            return CarouselSlider(
                items: popularList.map((item) => InkWell(
                  onTap: (){
                    navigateToDetails(item);
                  },
                  child: PopularWidget(image: 'https://image.tmdb.org/t/p/w500/${item.backdropPath}',
                  image2: 'https://image.tmdb.org/t/p/w500/${item.posterPath}', title: item.title ?? "",
                  date: item.releaseDate ?? "",),
                )).toList(),
                options: CarouselOptions(
                  aspectRatio: 2 ,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  height: MediaQuery.of(context).size.height/3
                ));
          }
          }
          ),
    );
  }

  @override
  void navigateToDetails(Results result) {
    Navigator.pushNamed(context, MovieDetailsScreen.routeName , arguments: {
      "title" : result.title ,
      "image" : result.backdropPath,
      "poster" : result.posterPath ,
      "rate" : result.voteAverage ,
      "date" : result.releaseDate ,
      "description" : result.overview ,
    });
  }
}