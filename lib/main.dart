import 'package:flutter/material.dart';
import 'package:movies_app/categoryListFiltered/categoryListFiltered.dart';
import 'package:movies_app/majorScreen.dart';
import 'package:movies_app/movie_details/movie_details_screen.dart';
import 'package:movies_app/movie_details/movie_details_screen_topRated.dart';
import 'package:movies_app/theming/themeData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movies_app/watchList/watchListScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
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
        MovieDetailsScreenTopRated.routeName :(context) => MovieDetailsScreenTopRated(),
        CategoryListFiltered.routeName : (context) => CategoryListFiltered(),
        WatchListScreen.routeName : (context) => WatchListScreen()
      } ,
      theme: ThemingData.lightTheme,
    );
  }
}

