import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/seasonModel.dart';

class SeasonInfo extends StatelessWidget {

  final SeasonModel season;

  SeasonInfo({
    this.season
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
            Hero(
              tag: season.id,
              child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage( season.getPosterImg() ),
                height: 200.0,
              ),
            ),
            ),
        
          SizedBox(width: 20.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(season.name, style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold), ),
                Text(season.airDate,  style: TextStyle(fontSize: 17.0,color: Colors.black38),),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}