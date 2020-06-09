import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/bloc/favoritesBloc.dart';
import 'package:flutter_tv_shows/src/models/tvShowModel.dart';

class TvShowDetailsName extends StatelessWidget {

  final TvShowModel show;
  final FavoritesBloc favoritesBloc;
  final bool isFavorite;
  final Function onPressedFavorite;

  TvShowDetailsName({
    this.onPressedFavorite,
    this.show,
    this.favoritesBloc,
    this.isFavorite});

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
              child: Text(
              show.name,
              style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
                  color: Theme.of(context).accentColor,
                  icon: isFavorite? Icon(Icons.favorite): Icon(Icons.favorite_border) ,
                  iconSize: 30.0,
                  onPressed:  onPressedFavorite
                ),
              
        ]
      ),
    );
  
  }
}