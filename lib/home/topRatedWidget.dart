import 'package:flutter/material.dart';
import 'package:movies_app/home_view_model/topRated_widget_view_model.dart';
import 'package:movies_app/model/TopRatedModel.dart';
import 'package:provider/provider.dart';
import '../home_navigator/top_rated_widget_navigator.dart';
import '../watchList/watchListScreen.dart';

class TopRatedWidget extends StatefulWidget {
  String image ;
  String title ;
  String date ;
  double vote ;
  ResultsTopRated resultsTopRated ;
  TopRatedWidget({required this.image , required this.title , required this.date , required this.vote ,
  required this.resultsTopRated});

  @override
  State<TopRatedWidget> createState() => _TopRatedWidgetState();
}

class _TopRatedWidgetState extends State<TopRatedWidget> implements TopRatedWidgetNavigator {

  TopRatedWidgetViewModel viewModel = TopRatedWidgetViewModel() ;
  @override
  void initState() {
    viewModel.navigator = this ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create : (context) => viewModel,
      child: Container(
        width: 100,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Image(image: NetworkImage(widget.image) , width: 100 , height: 150,) ,
                  Row(
                    children: [
                      Icon(Icons.star , size: 20, color: Colors.yellow,) ,
                      Text("${widget.vote}", style: TextStyle(color: Colors.white , fontSize: 11 , fontWeight: FontWeight.bold ) ),
                    ],
                  ),
                  Text(widget.title , style: TextStyle(color: Colors.white , fontSize: 11 , fontWeight: FontWeight.bold ),) ,
                  Text(widget.date , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold),),
                ],
              ),
              CircleAvatar(
                backgroundColor: Color(0xff514F4F),
                child: IconButton(
                    onPressed: (){
                       addMovie(widget.resultsTopRated);
                       navigateToFavourite(widget.resultsTopRated);
                    },
                    icon: Icon(Icons.add , color: Colors.white, size: 20,)),
              )
            ],
          )
        ),
      ),
    );
  }

  void addMovie(ResultsTopRated resultsTopRated) {
    viewModel.addMovieToFireBase(
        resultsTopRated.title ?? "",
        resultsTopRated.posterPath ?? "",
        resultsTopRated.releaseDate ?? "",
        resultsTopRated.originalLanguage ?? "");
  }
  @override
  void navigateToFavourite(ResultsTopRated resultsTopRated) {
    Navigator.pushNamed(context, WatchListScreen.routeName);
  }
}