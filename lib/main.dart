import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/pages/episodeDetailsPage.dart';
import 'package:flutter_tv_shows/src/pages/homePage.dart';
import 'package:flutter_tv_shows/src/pages/main.dart';
import 'package:flutter_tv_shows/src/pages/seasonDetailsPage.dart';
import 'package:flutter_tv_shows/src/pages/tvShowDetailsPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TV Series ',
      initialRoute: 'main',
      routes: {
          'main'            : (BuildContext context) => MainPage(),
          'home'            : (BuildContext context) => HomePage(),
          'tvShowDetails'   : (BuildContext context) => ShowDetailspage(),
          'seasonDetails'   : (BuildContext context) => SeasonDetailspage(),
          'episodeDetails'  : (BuildContext context) => EpisodeDetailsPage(),
          'favoritesDetails': (BuildContext context) => HomePage(),
          
      },
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.deepPurpleAccent
      ),
    );
  }
}