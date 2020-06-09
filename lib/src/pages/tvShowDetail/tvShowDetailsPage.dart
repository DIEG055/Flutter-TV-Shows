import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/bloc/favoritesBloc.dart';

import 'package:flutter_tv_shows/src/models/tvShowModel.dart';
import 'package:flutter_tv_shows/src/pages/tvShowDetail/widgets/tvShowDetailInfo.dart';
import 'package:flutter_tv_shows/src/pages/tvShowDetail/widgets/tvShowDetailsAppBar.dart';
import 'package:flutter_tv_shows/src/pages/tvShowDetail/widgets/tvShowMainInfo.dart';
import 'package:flutter_tv_shows/src/pages/tvShowDetail/widgets/tvShowNetworkInfo.dart';
import 'package:flutter_tv_shows/src/pages/tvShowDetail/widgets/tvShowOverviewInfo.dart';
import 'package:flutter_tv_shows/src/pages/tvShowDetail/widgets/tvShowSimilarInfo.dart';
import 'package:flutter_tv_shows/src/pages/tvShowDetail/widgets/tvShowdetailsName.dart';
import 'package:flutter_tv_shows/src/pages/tvShowDetail/widgets/tvshowSeasonInfo.dart';
import 'package:flutter_tv_shows/src/providers/tvShowProvider.dart';

class ShowDetailspage extends StatefulWidget {

  @override
  _ShowDetailspageState createState() => _ShowDetailspageState();
}

class _ShowDetailspageState extends State<ShowDetailspage> {

  bool isFavorite = false;
  StreamSubscription<bool> streamSubscription;


  ondispose(){
  streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    
  final favoritesBloc    = new FavoritesBloc();
  final TvShowModel show = ModalRoute.of(context).settings.arguments;
  final provider         = TvShowProvider();
  final showInfo         = provider.getTvShowById(show.id);
  final similarShowsInfo = provider.getSimilarTvShowById(show.id);
  streamSubscription = favoritesBloc.favoriteShowStream.listen((value) {});
  favoritesBloc.getShow(show.id);
  streamSubscription.onData((data) {isFavorite = data;});


    return Container(
      child: Scaffold(
        body:CustomScrollView(
          slivers:<Widget>[
            TvShowDetailsAppbar(show: show), 
            FutureBuilder(
              future: showInfo,
              builder: (context, AsyncSnapshot<TvShowModel> snapshot){
                if(snapshot.hasData){
                  final show = snapshot.data;
                  return SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        TvShowDetailsName(
                          show: show,
                          favoritesBloc: favoritesBloc,
                          isFavorite: isFavorite,
                          onPressedFavorite: ()  {
                            isFavorite? favoritesBloc.deleteShow(show.id):favoritesBloc.addShow(show);
                            setState(() { isFavorite = !isFavorite; });
                          }
                        ),
                        TvShowMainInfo(show: show),
                        TvShowDetailInfo(show:show),
                        SizedBox(height: 30.0),
                        TvShowOverviewInfo(show:show),
                        TvShowNetworkInfo(show:show),
                        TvShowSeasonInfo(show:show),
                        TvShowsSimilarShow(showFuture: similarShowsInfo,)
                      ]
                    ),
                  );       
                }else{
                  print("no data");
                  return SliverList(
                    delegate: SliverChildListDelegate([Center(child: CircularProgressIndicator())])); 
                }
              }
            )
          ]
        )
      ),
    );
  }
}