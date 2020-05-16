import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/pages/homePage.dart';
import 'package:flutter_tv_shows/src/pages/tvShowDetailsPage.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TV Series ',
      initialRoute: 'home',
      routes: {
          'home'            : (BuildContext context) => HomePage(),
          'tvShowDetails'   : (BuildContext context) => ShowDetailspage(),
          'seasonDetails'   : (BuildContext context) => HomePage(),
          'episodeDetails'  : (BuildContext context) => HomePage(),
          'favoritesDetails': (BuildContext context) => HomePage(),
          
      },
    );
  }
}