import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/tvShowModel.dart';

class TvShowDetailsAppbar extends StatelessWidget {

  final TvShowModel show;

  TvShowDetailsAppbar({this.show});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Theme.of(context).primaryColor,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          show.name,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage( show.getBackdropImage() ),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}