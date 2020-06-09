import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/episodeModel.dart';

class EpisodeDetailsAppBar extends StatelessWidget {

  final EpisodeModel episode;

  EpisodeDetailsAppBar({@required this.episode});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Theme.of(context).primaryColor,
      expandedHeight: 200.0,
      floating: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: FadeInImage(
          image: NetworkImage( episode.getStillImg() ),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}