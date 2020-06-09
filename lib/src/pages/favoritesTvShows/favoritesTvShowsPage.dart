import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/bloc/favoritesBloc.dart';
import 'package:flutter_tv_shows/src/pages/favoritesTvShows/widgets/similarShowInfo.dart';

class FavoritesShowsPage extends StatelessWidget {


  final favoritesBloc = FavoritesBloc();

  @override
  Widget build(BuildContext context) {
  
  favoritesBloc.getShows();
  
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Favorites",style: TextStyle(color: Theme.of(context).primaryColor),),
          centerTitle: false,
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              color: Theme.of(context).primaryColor,
              icon: Icon(Icons.delete),
              onPressed: (){ favoritesBloc.deleteAllShows();  }
            )
          ],
        ),
        
        body: SingleChildScrollView(
          child: SimilarShowInfo(favoritesBloc: favoritesBloc)
        )
      )
    );
  }



}