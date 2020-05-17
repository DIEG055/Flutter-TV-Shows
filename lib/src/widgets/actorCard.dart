import 'package:flutter/material.dart';

import 'package:flutter_tv_shows/src/models/actorModel.dart';

class ActorCard extends StatelessWidget {

  final BuildContext context;
  final ActorModel actor;

  ActorCard({@required this.context, @required this.actor});

  @override
  Widget build(BuildContext context) {
    final card = Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 6,
                  blurRadius: 9,
                  offset: Offset(0, 3),
                )
              ]
                ),
            child: Hero(
              tag: actor.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: FadeInImage(
                  height: 125.0,
                  image: NetworkImage( actor.getProfileImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Flexible(
            child: Text(
              actor.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ]
      )
    );

    return GestureDetector(
      child: card,
      onTap: (){
        // Navigator.pushNamed(context, 'ActorDetails', arguments: {"Actor":Actor,"showId":showId} );
      },
    );
  }
}