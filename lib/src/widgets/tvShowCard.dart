import 'package:flutter/material.dart';

import 'package:flutter_tv_shows/src/models/tvShowModel.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class TvShowCard extends StatelessWidget {

  final BuildContext context;
  final TvShowModel show;

  TvShowCard({@required this.context, @required this.show });

  @override
  Widget build(BuildContext context) {
    final card = Container(
        // decoration: BoxDecoration(border: Border.all(width:1)),
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 6,
                  blurRadius: 9,
                  offset: Offset(0, 3),
                )]
                  ),
                      child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage(
                image: NetworkImage( show.getPosterImage() ),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Flexible(
              child: Text(
                show.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          Container(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
              children: <Widget>[
                SmoothStarRating(
                  allowHalfRating: false,
                  onRated: (v) {
                  },
                  starCount: 5,
                  rating: (show.voteAverage/2),
                  size: 20.0,
                  halfFilledIconData:  Icons.star_half,
                  filledIconData: Icons.star,
                  color: Colors.purple,
                  borderColor: Colors.purple,
                  spacing:0.1
                ),
                SizedBox(width: 5.0),
                Text(
                  ((show.voteAverage/2).toStringAsFixed(1)),
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
              ),
            ),
          )
          ],
        ),
      );

    return GestureDetector(
      child: card,
      onTap: (){
        Navigator.pushNamed(context, 'tvShowDetails', arguments: show );
      },
    );
  }
}