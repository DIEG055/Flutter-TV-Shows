import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/episodeModel.dart';
import 'package:flutter_tv_shows/src/pages/episodeDetails/widgets/appBar.dart';
import 'package:flutter_tv_shows/src/pages/episodeDetails/widgets/guestStartInfo.dart';
import 'package:flutter_tv_shows/src/pages/episodeDetails/widgets/overviewInfo.dart';
import 'package:flutter_tv_shows/src/pages/episodeDetails/widgets/showName.dart';

class EpisodeDetailsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  final dynamic  args             = ModalRoute.of(context).settings.arguments;
  final  EpisodeModel episodeData =  args["episode"];         


  return Container(
      child: Scaffold(
        body:CustomScrollView(
          slivers:<Widget>[
            EpisodeDetailsAppBar(episode: episodeData),
            SliverList(
              delegate:SliverChildListDelegate(
                [ 
                  EpisodeDetailsShowName(episode: episodeData),
                  SizedBox(height: 20.0,),
                  EpisodeDetailsOverview(episode: episodeData),
                  GuestStartInfo(episode: episodeData)
                ] ,
              )
            )
          ]
        ),
      ),
    );
  }






}