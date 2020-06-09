import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/seasonModel.dart';

class SeasonDetailsAppBar extends StatelessWidget {

  final SeasonModel season;

  SeasonDetailsAppBar({
    this.season
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Theme.of(context).primaryColor,
      expandedHeight: 50.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          season.name,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        )
      ),
    );
  }
}