import 'package:flutter/material.dart';

import 'package:flutter_tv_shows/src/models/seasonModel.dart';
import 'package:flutter_tv_shows/src/pages/seasonDetail/widgets/seasonDetailsAppBar.dart';
import 'package:flutter_tv_shows/src/pages/seasonDetail/widgets/seasonInfo.dart';
import 'package:flutter_tv_shows/src/providers/tvShowProvider.dart';

import 'widgets/episodeInfo.dart';


class SeasonDetailspage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
  final dynamic  arg                   = ModalRoute.of(context).settings.arguments;
  final SeasonModel seasonData         = arg["season"];
  final TvShowProvider provider        = TvShowProvider();
  final Future<SeasonModel> seasonInfo = provider.getSeasonById(arg["showId"],seasonData.seasonNumber);

    return Container(
      child: Scaffold(
        body:CustomScrollView(
          slivers:<Widget>[
            SeasonDetailsAppBar(season: seasonData,),
            SliverList(
              delegate:SliverChildListDelegate(
                [ 
                  SeasonInfo(season: seasonData),
                  FutureBuilder(
                    future: seasonInfo,
                    builder: (context, AsyncSnapshot<SeasonModel> snapshot){
                      if(snapshot.hasData){
                        final season = snapshot.data;
                        return EpisodeInfo(season:season,arg:arg);                                   
                      }else{
                        return Container(
                          child: Center(child: CircularProgressIndicator())); 
                      }
                    }
                  )
                ] ,
            )
        )
          ]
      ),
    ),
    );
  }


}