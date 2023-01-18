import 'package:flutter/material.dart';
import 'package:movies_app/browse/browseScreen.dart';
import 'package:movies_app/home/homeScreen.dart';
import 'package:movies_app/search/searchScreen.dart';
import 'package:movies_app/watchList/watchListScreen.dart';

class MajorScreen extends StatefulWidget{
  static const String routeName = "major" ;

  @override
  State<MajorScreen> createState() => _MajorScreenState();
}

class _MajorScreenState extends State<MajorScreen> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30) , topRight: Radius.circular(30)),
          child: Theme(
            data: Theme.of(context).copyWith(canvasColor: const Color(0xff514F4F)),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index){
                selectedIndex = index ;
                setState((){});
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home) ,
                label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search) ,
                    label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.open_in_browser_rounded) ,
                    label: "Browse"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.featured_play_list_sharp) ,
                    label: "WatchList"),
              ],
            ),
          ),
        ),
        body: tabsList[selectedIndex],
      ),
    );
  }
  List<Widget> tabsList = [HomeScreen() , SearchScreen() , BrowseScreen() , WatchListScreen()];
}