import 'package:flutter/material.dart';
import 'package:movies_app/api_Functions/api_fun.dart';

import '../model/CategoryFilteredListModel.dart';

class CategoryListFiltered extends StatelessWidget {
  static const String routeName = "filtered" ;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Map ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Welcome to category : ${args["category_name"]} " , style: TextStyle(
          color: Colors.white , fontWeight: FontWeight.bold
        ), maxLines: 2,),
        centerTitle: true,
      ),
      body: FutureBuilder<CategoryFilteredListModel>(
        future: ApiFun.getCategoryFilterList(),
          builder: (context , asyncSnapShot) {
             if (asyncSnapShot.connectionState == ConnectionState.waiting) {
               return Center(child: CircularProgressIndicator(),);
                 }else if (asyncSnapShot.hasError){
                      return Column(
                          children: [
                        Text(asyncSnapShot.error.toString() , style: TextStyle(color: Colors.white),) ,
                           ElevatedButton(
                            onPressed: (){
                               ApiFun.getCategoryFilterList() ;
                                },
                               child: Text("Try again"))
                              ],
                             );
                               }else {
                                          //dat
               var categoryFilteredList = asyncSnapShot.data?.results ?? [];
               return ListView.separated(
                   itemBuilder: (context , index) => Container(
                     child: Text(categoryFilteredList[index].releaseDate ?? ""
                       , style: TextStyle(color: Colors.white),),
                   ),
                   separatorBuilder: (context , index) => SizedBox(height: 10,),
                   itemCount: categoryFilteredList.length);
                                       }
                                  }),
                                );
  }
}