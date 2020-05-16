import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/tvShowModel.dart';
import 'package:flutter_tv_shows/src/widgets/tvShowCard.dart';

class CardHorizonalScroll extends StatelessWidget {

  final List<TvShowModel> tvShows;
  final Function nextPage;

  CardHorizonalScroll({@required this.tvShows, @required this.nextPage});


  final _pageController = new PageController(
    initialPage: 0,
    viewportFraction: 0.4
  );

  @override
  Widget build(BuildContext context) {

    _pageController.addListener( () {
      if ( _pageController.position.pixels >= _pageController.position.maxScrollExtent - 200 ){
        nextPage();
      }
    });

    return Container(
      height: 275.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: tvShows.length,
        itemBuilder: ( context, i ) => TvShowCard(context:context, show:tvShows[i] ),
        ),
      );
  }




}

