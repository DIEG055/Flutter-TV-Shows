import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_tv_shows/src/models/tvShowModel.dart';

class CardSwiper extends StatelessWidget {

  final List<TvShowModel> tvShows;
  CardSwiper({ @required this.tvShows });

  @override
  Widget build(BuildContext context) {

  final _screenSize = MediaQuery.of(context).size;

  return  Container(
    padding: EdgeInsets.only(top:20.0),
    height: _screenSize.height*0.25,
    width: _screenSize.width,
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 1,
        blurRadius: 7,
        offset: Offset(0, 5),
    )]
  ),
      child: Swiper(
        itemCount: tvShows.length,
        viewportFraction: 0.75,
        scale: 0.7,
        itemBuilder: (BuildContext context,int index){
          final item = ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Stack(
              children:  <Widget>[
                FadeInImage(
                  height: _screenSize.height*0.25,
                  image: NetworkImage( tvShows[index].getBackdropImage()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover, 
                ),
                Container(
                  height: _screenSize.height*0.25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.grey.withOpacity(0.0),
                        Colors.black.withOpacity(0.7),
                      ],
                      stops: [
                        0.0,
                        1.0
                      ]
                    )
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: 10,
                    child: 
                    Text(
                    tvShows[index].name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,fontSize: 20),
                      overflow: TextOverflow.ellipsis, // DOESN'T WORKD
                    ),
                )
              ]
              
            ),
        );

        return GestureDetector(
        child: item,
        onTap: (){
          Navigator.pushNamed(context, 'tvShowDetails', arguments: tvShows[index] );
        },
      );
      },
  ),
    ),
 
  );
  }
}