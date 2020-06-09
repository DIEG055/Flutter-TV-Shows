import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/tvShowModel.dart';

class TvShowMainInfo extends StatelessWidget {

  final TvShowModel show;

  TvShowMainInfo({this.show});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        left: _screenSize.width*0.05,
        right: _screenSize.width*0.05,
        top: 10.0
        ),
      height: 75.0,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(
                show.originCountry[0],
                style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
                ),
              Text(
                "Country",
                style: TextStyle(fontSize: 15.0,color: Colors.black38),
                )
            ],
            ),
          ),
          VerticalDivider(
            color: Theme.of(context).primaryColor,
            thickness: 3.0,
          ),
          Expanded(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(
                show.originalLanguage.toUpperCase(),
                style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
                ),
              Text(
                "Language",
                style: TextStyle(fontSize: 15.0,color: Colors.black38),
                )
            ],
            ),
          ),
          VerticalDivider(
            color: Theme.of(context).primaryColor,
            thickness: 3.0
          ),
          Expanded(
              child: Column(
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
                      show.voteAverage.toString(),
                      style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
                      ),
                  ),
                ],
              ),
              Text(
                show.voteCount.toString(),
                style: TextStyle(fontSize: 15.0,color: Colors.black38),
                )
            ],
            ),
          ),
        ],
        ),
    );
  
  }
}