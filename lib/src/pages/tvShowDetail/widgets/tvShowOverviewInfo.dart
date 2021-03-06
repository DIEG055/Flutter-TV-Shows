import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/tvShowModel.dart';

class TvShowOverviewInfo extends StatelessWidget {

  final TvShowModel show;

  TvShowOverviewInfo({this.show});

  @override
  Widget build(BuildContext context) {
      final _screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: _screenSize.width*0.05,
        right: _screenSize.width*0.05,
        top: 10.0
        ),
      child: Column(
        children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Overview",
            style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
            textAlign:TextAlign.left,)),
          SizedBox(height: 5.0,),
          Text(
            show.overview,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15.0,color: Colors.black38),
            )
        ],
      ),
    );
  }
}