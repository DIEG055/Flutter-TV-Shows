import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/networkModel.dart';
import 'package:flutter_tv_shows/src/models/tvShowModel.dart';

class TvShowNetworkInfo extends StatelessWidget {

  final TvShowModel show;

  TvShowNetworkInfo({this.show});

  @override
  Widget build(BuildContext context) {
      final _screenSize = MediaQuery.of(context).size;
  _networkImage(NetworkModel network){
    return Container(
        // decoration: BoxDecoration(border: Border.all(width:1)),
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: FadeInImage(
        image: NetworkImage( network.getLogoImg()),
        placeholder: AssetImage('assets/img/no-image.jpg'),
        fit: BoxFit.scaleDown,
        ),
    );
  }
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
          "Networks",
          style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
          textAlign:TextAlign.left,)),
        SizedBox(height: 5.0,),
        SizedBox(
          height: _screenSize.height*0.05,
            child: PageView.builder(
            pageSnapping: false,
            controller: PageController(
              viewportFraction: 0.33,
              initialPage: 0
            ),
            itemCount: show.networks.items.length,
            itemBuilder: (context, i) =>_networkImage( show.networks.items[i]),
          ),
        ),
      ],
    ),
  );
  
  }
}