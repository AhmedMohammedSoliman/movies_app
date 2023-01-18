import 'package:flutter/material.dart';
import 'package:movies_app/categoryListFiltered/categoryListFiltered.dart';
import 'package:movies_app/majorScreen.dart';
import 'package:movies_app/movie_details/movie_details_screen.dart';
import 'package:movies_app/theming/themeData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MajorScreen.routeName ,
      routes: {
        MajorScreen.routeName : (context) => MajorScreen(),
        MovieDetailsScreen.routeName :(context) => MovieDetailsScreen(),
        CategoryListFiltered.routeName : (context) => CategoryListFiltered(),
      } ,
      theme: ThemingData.lightTheme,
    );
  }
}

