import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/tvShowModel.dart';
import 'package:flutter_tv_shows/src/providers/tvShowProvider.dart';
import 'package:flutter_tv_shows/src/widgets/cardHorizontalScroll.dart';

class HorizontalStructure extends StatelessWidget {

  final String tvShowName;
  final String route;
  final Stream<List<TvShowModel>> dataStream ;
  final TvShowProvider tvShowsProvider;

  HorizontalStructure({
    this.tvShowName,
    this.route,
    this.dataStream,
    this.tvShowsProvider
  });

  @override
  Widget build(BuildContext context) {
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
                    color: Theme.of(context).primaryColor,
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