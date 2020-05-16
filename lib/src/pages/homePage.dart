import 'package:flutter/material.dart';

import 'package:flutter_tv_shows/src/models/tvShowModel.dart';
import 'package:flutter_tv_shows/src/providers/tvShowProvider.dart';
import 'package:flutter_tv_shows/src/search/searchDelegate.dart';
import 'package:flutter_tv_shows/src/widgets/cardHorizontalScroll.dart';
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
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
            IconButton(
              color: Colors.deepPurple,
              icon: Icon(Icons.search),
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
              _latestTvShow(context),
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

  Widget _topRatedTvShows()    => _horizontalStructure("Top Rated", "", tvShowsProvider.topRatedStream);

  Widget _airingTodayTvShows() => _horizontalStructure("Today Shows", "", tvShowsProvider.airingTodayStream);

  Widget _popularTvShows()     => _horizontalStructure("Popular", "", tvShowsProvider.airingTodayStream);

  Widget _latestTvShow(BuildContext context){

  return StreamBuilder(
    stream: tvShowsProvider.airingTodayStream,
    builder: (BuildContext context, AsyncSnapshot<List<TvShowModel>> snapshot){
      if(snapshot.hasData){
      final show = snapshot.data[0];
        return  Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              width: double.infinity,
              child: Text("Discover", 
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              width: double.infinity,
              height: 200.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: FadeInImage(
                  image: NetworkImage( show.getBackdropImage() ),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                boxShadow: [
                  BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 6,
                  blurRadius: 9,
                  offset: Offset(0, 3),
                  )
                ]
              ),
            ),
          ]
        );
      }else{
        return Container(
          height: 350.0,
          child: Center(
            child: CircularProgressIndicator()
          )
        );
      }
    },
  );

    // return GestureDetector(
    //   child: card,
    //   onTap: (){
    //     Navigator.pushNamed(context, 'detalle', arguments: {} );
    //   },
    // );
  }
  
  Widget _horizontalStructure(String tvShowName, String route,Stream<List<TvShowModel>> dataStream ){
    return Container(
      width : double.infinity,
      child: Column( 
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:25.0,bottom: 5,left: 25.0),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children:<Widget>[ 
                  Expanded(
                    child: Text(tvShowName, 
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
                      ),
                  ),
                  IconButton(
                    color: Colors.deepPurple,
                    icon: Icon(Icons.arrow_forward),
                    onPressed: (){
                // route
              },)
                ]
              ),
            ),
          ),
          StreamBuilder(
            // stream: tvShowsProvider.topRatedStream,
            stream: dataStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if ( snapshot.hasData ) {
                return CardHorizonalScroll(tvShows:snapshot.data, nextPage:tvShowsProvider.getTopRatedTvShows,);
              } else {
                return Container(
                  height: 350.0,
                  child: Center(
                    child: CircularProgressIndicator()
                  )
                );
              }
            },
          )
      ],)
    );
  }

}