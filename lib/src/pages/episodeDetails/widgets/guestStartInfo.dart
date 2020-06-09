import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/episodeModel.dart';
import 'package:flutter_tv_shows/src/widgets/actorCard.dart';

class GuestStartInfo extends StatelessWidget {
  final EpisodeModel episode;

  GuestStartInfo({@required this.episode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width : double.infinity,
      child: Column( 
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:25.0,bottom: 5,left: 25.0),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children:<Widget>[ 
                  Expanded(
                    child: Text("Guest Stars", 
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
                      ),
                  ),
                ]
              ),
            ),
          ),
          SizedBox(
            height: 200.0,
            child: PageView.builder(
              pageSnapping: false,
              controller: PageController(
                viewportFraction: 0.3,
                initialPage: 1
              ),
              itemCount: episode.guessStarts.items.length,
              itemBuilder: (context, i) =>ActorCard(context: context, actor: episode.guessStarts.items[i] ),
            ),
          )
      ],)
    );
  }
}