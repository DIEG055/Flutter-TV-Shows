import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/tvShowModel.dart';
import 'package:flutter_tv_shows/src/widgets/seasonCard.dart';

class TvShowSeasonInfo extends StatelessWidget {

  final TvShowModel show;

  TvShowSeasonInfo({this.show});


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
                    child: Text("Seasons", 
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
                      ),
                  ),
                  IconButton(
                    color: Theme.of(context).accentColor,
                    icon: Icon(Icons.arrow_forward),
                    onPressed: (){
                // route
              },)
                ]
              ),
            ),
          ),
          SizedBox(
            height: 200.0,
            child: PageView.builder(
              pageSnapping: false,
              controller: PageController(
                viewportFraction: 0.3,
                initialPage: 1
              ),
              itemCount: show.seasons.items.length,
              itemBuilder: (context, i) =>SeasonCard(context: context,  season:show.seasons.items[i],showId: show.id ),
            ),
          )
      ],)
    );
 
  }
}