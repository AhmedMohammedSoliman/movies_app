import 'package:flutter/material.dart';
import 'package:movies_app/search/searchList.dart';

class SearchScreen extends StatefulWidget{
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String search = "" ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                onChanged: (text){
                  search = text ;
                setState((){});
                },
                decoration: InputDecoration(
                  hintText: "Search here ....." ,
                  hintStyle: TextStyle(color: Colors.white , fontSize: 18),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  filled: true,
                  fillColor: Colors.grey,
                  suffixIcon: Icon(Icons.search , size: 25, color: Colors.white,)
                ),
              ),
            ),
            SearchList(query: search,)
          ],
        ),
      ),
    );
  }
}