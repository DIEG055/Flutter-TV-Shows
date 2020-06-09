import 'package:flutter/material.dart';

import 'package:flutter_tv_shows/src/pages/homePage/widgets/horizontalStructure.dart';
import 'package:flutter_tv_shows/src/pages/homePage/widgets/latestShows.dart';
import 'package:flutter_tv_shows/src/providers/tvShowProvider.dart';
import 'package:flutter_tv_shows/src/search/searchDelegate.dart';
import 'package:flutter_tv_shows/src/widgets/cardSwiper.dart';


class HomePage extends StatelessWidget {
  final tvShowsProvider =  new TvShowProvider();

  @override
  Widget build(BuildContext context) {

  tvShowsProvider.getTopRatedTvShows();
  tvShowsProvider.getAiringTodayTvShows();
  tvShowsProvider.getLatestTvShow();


    return Scaffold(
      appBar: AppBar(
        title: Text("Home",style: TextStyle(color: Colors.white),),
          centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: (){
                showSearch(
                context: context, 
                delegate: DataSearch(),
                );
              })
      ],),
      body: SingleChildScrollView(
              child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _trendTvShowsSwiper(),
              _topRatedTvShows(),
              _airingTodayTvShows(),
              LatestShows(tvShowsProvider: tvShowsProvider),
              _popularTvShows()
              ],
          ),
        ),
      )
    );
  }


  // --------------------Widgets--------------------         
  
  Widget _trendTvShowsSwiper() { 
    return FutureBuilder(
      future: tvShowsProvider.getPopularTvShows(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if ( snapshot.hasData ) {
          return CardSwiper(tvShows:snapshot.data);
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }
      },
    );
  }

  Widget _topRatedTvShows() => HorizontalStructure(tvShowName: "Top Rated", route:"", dataStream:tvShowsProvider.topRatedStream, tvShowsProvider: tvShowsProvider);

  Widget _airingTodayTvShows() => HorizontalStructure(tvShowName: "Today Shows", route:"", dataStream:tvShowsProvider.topRatedStream, tvShowsProvider: tvShowsProvider);
  
  Widget _popularTvShows() => HorizontalStructure(tvShowName: "Popular", route:"", dataStream:tvShowsProvider.airingTodayStream, tvShowsProvider: tvShowsProvider);

}