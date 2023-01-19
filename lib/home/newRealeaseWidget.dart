import 'package:flutter/material.dart';
import 'package:movies_app/home_navigator/newRealease_widget_navigator.dart';
import 'package:movies_app/home_view_model/newRealease_widget_view_model.dart';
import 'package:movies_app/model/PopularModel.dart';
import 'package:movies_app/watchList/watchListScreen.dart';
import 'package:provider/provider.dart';

class NewRealeaseWidget extends StatefulWidget{
   String image ;
   Results results ;
   NewRealeaseWidget({required this.image , required this.results});

  @override
  State<NewRealeaseWidget> createState() => _NewRealeaseWidgetState();
}

class _NewRealeaseWidgetState extends State<NewRealeaseWidget> implements NewRealeaseWidgetNavigator{

  NewRealeaseWidgetViewModel viewModel = NewRealeaseWidgetViewModel() ;
  @override
  void initState() {
   viewModel.navigator = this ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create : (context) => viewModel ,
      child: Container(
        width: 100,
        height: 150,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Image(image: NetworkImage(widget.image) , fit: BoxFit.fill),
            CircleAvatar(
              backgroundColor: Color(0xff514F4F),
              child: IconButton(
                  onPressed: (){
                    addMovie (widget.results);
                    navigateToFavourite(widget.results);
                  },
                  icon: Icon(Icons.add , color: Colors.white, size: 20,)),
            )
          ],
        ),
      ),
    );
  }

  void addMovie(Results results) {
    viewModel.addMovieToFavourite(
        results.title ?? "",
        results.posterPath ?? "",
        results.releaseDate ?? "",
        results.originalLanguage ?? "");
  }
  @override
  void navigateToFavourite(Results results) {
    Navigator.pushNamed(context, WatchListScreen.routeName);
  }
}