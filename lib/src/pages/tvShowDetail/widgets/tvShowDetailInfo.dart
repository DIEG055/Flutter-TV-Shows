import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/tvShowModel.dart';

class TvShowDetailInfo extends StatelessWidget {

  final TvShowModel show;

  TvShowDetailInfo({this.show});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    Widget _info(String text,String content) {
      return Row(
        children: <Widget>[
          Expanded(
            child: Text(
            text,
            style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
            content,
            style: TextStyle(fontSize: 17.0, color: Colors.black38),
            ),
          ),
        ],
      
      );
    }

    return Container(
      margin: EdgeInsets.only(
        left: _screenSize.width*0.05,
        right: _screenSize.width*0.05,
        top: 15.0
        ),
      child: Column(children: <Widget>[
        _info("Creator:", show.director.items[0].name),
        SizedBox(height: 10.0,),
        _info("Genre:", show.genres.items[0].name),
        SizedBox(height: 10.0,),
        _info("First Episode:", show.firstAirDate)
      ],)
    );
  }
}