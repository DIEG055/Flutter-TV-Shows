import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/episodeModel.dart';

class EpisodeDetailsShowName extends StatelessWidget {

  final EpisodeModel episode;

  EpisodeDetailsShowName({this.episode});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        left: _screenSize.width*0.05,
        right: _screenSize.width*0.05,
        top: 10.0
        ),
      child: Row(
        children: <Widget>[ 
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                  episode.name,
                  style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),
            ),
                  Text(
                    episode.airDate,
                  style: TextStyle(fontSize: 17.0,color: Colors.black38),

                  )
                ],
              ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    color: Colors.yellow,
                    icon: Icon(Icons.star),
                    iconSize: 30.0,
                    onPressed: (){}
                  ),
                  Container(
                    child: Text(
                      episode.voteAverage.toStringAsPrecision(2),
                      style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
                      ),
                  ),
                ],
              ),
            ],
            ),
        ]
      ),
    );
  }
}