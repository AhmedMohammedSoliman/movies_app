import 'package:flutter/material.dart';
import 'package:movies_app/api_Functions/api_fun.dart';
import 'package:movies_app/browse/browse_navigator.dart';
import 'package:movies_app/browse/browse_view_model.dart';
import 'package:movies_app/categoryListFiltered/categoryListFiltered.dart';
import 'package:movies_app/home/categoryWidget.dart';
import 'package:movies_app/model/CategoryModel.dart';
import 'package:provider/provider.dart';

class BrowseScreen extends StatefulWidget{

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> implements BrowseNavigator{

  List<String> imageList = ["assets/images/action.webp" ,
    "assets/images/adventure.jpg" ,
    "assets/images/animation.jpg" ,
    "assets/images/comedy.jpg" ,
    "assets/images/crime.jpg" ,
    "assets/images/documentary.webp" ,
    "assets/images/drama.jpg" ,
    "assets/images/family.jpg" ,
    "assets/images/fantasty.jpg" ,
    "assets/images/history.jpg" ,
    "assets/images/horor.jpg" ,
    "assets/images/music.jpg" ,
    "assets/images/mystery.jpg" ,
    "assets/images/romancy.jpg" ,
    "assets/images/science.jpg" ,
    "assets/images/tv.jpg" ,
    "assets/images/thriller.webp" ,
    "assets/images/war.jpg" ,
    "assets/images/western.jpg" ,
  ];

  BrowseViewModel viewModel = BrowseViewModel() ;

  @override
  void initState() {
    viewModel.navigator = this ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: FutureBuilder<CategoryModel>(
        future: ApiFun.getCategoryList(),
          builder: (context , asyncSnapShot) {
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
             var categoryList = asyncSnapShot.data?.genres ?? [] ;
             return Container(
               padding: EdgeInsets.all(10),
               child: GridView.builder(
                 itemCount: categoryList.length,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2 ,
                     crossAxisSpacing: 10 ,
                     mainAxisSpacing: 10 ,
                   ),
                   itemBuilder: (context , index) => InkWell(
                     onTap: (){
                       navigateToCategoryFiltered(categoryList[index]);
                     },
                     child: CategoryWidget(
                         title: categoryList[index].name ?? "",
                         image: imageList[index]),
                   )),
             );
               }

              }),
    );
         }

  @override
  void navigateToCategoryFiltered(Genres genres) {
    Navigator.pushNamed(context, CategoryListFiltered.routeName , arguments: {
      "category_name" : genres.name
    });
  }
}