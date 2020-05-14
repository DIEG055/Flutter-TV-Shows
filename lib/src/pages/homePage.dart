import 'package:flutter/material.dart';

import 'package:flutter_tv_shows/src/providers/tvShowProvider.dart';
import 'package:flutter_tv_shows/src/widgets/cardHorizontalScroll.dart';
import 'package:flutter_tv_shows/src/widgets/cardSwiper.dart';


class HomePage extends StatelessWidget {
  final tvShowsProvider =  new TvShowProvider();
  // const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  tvShowsProvider.getTopRatedTvShows();


    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
            IconButton(
              color: Colors.deepPurple,
              icon: Icon(Icons.search),
              onPressed: (){},)
      ],),
      body: SingleChildScrollView(
              child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _trendTvShowsSwiper(),
              _topRatedTvShows(),
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

  Widget _topRatedTvShows(){
    return Container(
      width : double.infinity,

      child: Column( 
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top:25.0,bottom: 5,left: 25.0),
                      child: SizedBox(
              width: double.infinity,
              child: Text('Top Rated Shows', 
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              ),
            ),
          ),
          
          StreamBuilder(
            stream: tvShowsProvider.topRatedStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if ( snapshot.hasData ) {
                return CardHorizonalScroll(tvShows:snapshot.data, nextPage:tvShowsProvider.getTopRatedTvShows,);
              } else {
                return Container(
                  height: 400.0,
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