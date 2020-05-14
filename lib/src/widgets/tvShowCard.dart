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
        decoration: BoxDecoration(border: Border.all(width:1)),
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
                // overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
  SmoothStarRating(
          allowHalfRating: false,
          onRated: (v) {
           },
          starCount: 5,
          rating: 4.5,
          size: 40.0,
          halfFilledIconData:  Icons.blur_on,
          filledIconData: Icons.blur_off,
          // fullRatedIconData: Icons.blur_off,
          // halfRatedIconData: Icons.blur_on,
          color: Colors.green,
          borderColor: Colors.green,
          spacing:0.1
    )
          ],
        ),
      );

    return GestureDetector(
      child: card,
      onTap: (){
        Navigator.pushNamed(context, 'detalle', arguments: show );
      },
    );
  }
}