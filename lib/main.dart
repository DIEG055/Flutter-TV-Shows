import 'package:flutter/material.dart';

import 'package:flutter_tv_shows/src/pages/main.dart';

import 'src/pages/episodeDetails/episodeDetailsPage.dart';
import 'src/pages/homePage/homePage.dart';
import 'src/pages/seasonDetail/seasonDetailsPage.dart';
import 'src/pages/tvShowDetail/tvShowDetailsPage.dart';



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
        primaryColor: Color(0xff3AE2AE),
        accentColor: Color(0xff26E5AA),
      ),
    );
  }
}