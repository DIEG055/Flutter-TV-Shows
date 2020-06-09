import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/tvShowModel.dart';
import 'package:flutter_tv_shows/src/providers/tvShowProvider.dart';

class LatestShows extends StatelessWidget {

  final TvShowProvider tvShowsProvider;

  LatestShows({
    this.tvShowsProvider
  });

  @override
  Widget build(BuildContext context) {
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
  
  }
}