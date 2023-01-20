import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api_Functions/api_fun.dart';
import 'package:movies_app/model/SearchModel.dart';
import 'package:movies_app/movie_details/movie_details_screen_search.dart';
import 'package:movies_app/search/searchWidget.dart';
import 'package:movies_app/search/search_list_navigator.dart';
import 'package:movies_app/search/search_list_view_model.dart';
import 'package:provider/provider.dart';

class SearchList extends StatefulWidget{

  String query ;
  SearchList({required this.query});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> implements SearchListNavigator {

  SearchListViewModel viewModel = SearchListViewModel() ;
  @override
  void initState() {
    viewModel.navigator = this ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return ChangeNotifierProvider(
     create: (context) => viewModel,
     child: FutureBuilder<SearchModel>(
       future: ApiFun.getSearchList(widget.query),
         builder: (context , asyncSnapShot){
                 if (asyncSnapShot.connectionState == ConnectionState.waiting) {
                   return Center(child: CircularProgressIndicator(),);
                  }else if (asyncSnapShot.hasError){
                  return Column(
                 children: [
                  Text(asyncSnapShot.error.toString() , style: TextStyle(color: Colors.white),) ,
                ElevatedButton(
                    onPressed: (){
                    ApiFun.getCategoryList() ;
                    },
                   child: Text("Try again"))
                    ],
                  );
                 }else {
                   //data
                   var searchList = asyncSnapShot.data?.results ?? [] ;
                   return Expanded(
                       child: ListView.separated(
                         itemCount:searchList.length ,
                           separatorBuilder: (context , index) =>Divider(color: Colors.white,),
                           itemBuilder: (context , index) => InkWell(
                             onTap: (){
                             navigateToDetails(searchList[index]);
                             },
                             child: SearchWidget(
                                 image: 'https://image.tmdb.org/t/p/w500/${searchList[index].posterPath}',
                                 date: searchList[index].releaseDate ?? "",
                                 title: searchList[index].title ?? "",
                                 lan: searchList[index].originalLanguage ?? ""),
                           )
                       )
                   );
                 }
                      }),
   ) ;
  }
  @override
  void navigateToDetails(SearchResults results) {
    Navigator.pushNamed(context, MovieDetailsScreenSearch.routeName , arguments: {
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