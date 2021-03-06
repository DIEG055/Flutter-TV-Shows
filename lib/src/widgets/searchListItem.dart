import 'package:flutter/material.dart';

import 'package:flutter_tv_shows/src/models/tvShowModel.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SearchCard extends StatelessWidget {

  final TvShowModel show;

  SearchCard({@required this.show});


  double starCount(double voteAverage){
    double af = voteAverage.floor()/1;
    double temp = voteAverage - 0.5;
      return temp>= af ?  af+0.5 :  af;
  }


  @override
  Widget build(BuildContext context) {
    final item =  Container(
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
      child: Row(
        children:<Widget>[
          Container(
            child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: FadeInImage(
              width: 75.0,
              height: 110.0,
              image: NetworkImage( show.getPosterImage() ),
              placeholder: AssetImage('assets/img/no-image.jpg'),
              fit: BoxFit.cover,
              ),
            ),
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
          ),
          SizedBox(width: 15.0),
          Flexible(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Text(
                show.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20.0),
                ),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  SmoothStarRating(
                    allowHalfRating: true,
                    onRated: (v) {
                    },
                    starCount: 5,
                    rating: starCount(show.voteAverage/2),
                    size: 20.0,
                    halfFilledIconData:  Icons.star_half,
                    filledIconData: Icons.star,
                    color: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).primaryColor,
                    spacing:0.1
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    ((show.voteAverage/2).toStringAsFixed(1)),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
                )
            ],),
          )
        ] 
      ),
    );

    return GestureDetector(
      child: item,
      onTap: (){
        Navigator.pushNamed(context, 'tvShowDetails', arguments: show );
      },
    );

  }
}