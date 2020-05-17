import 'package:flutter/material.dart';

import 'package:flutter_tv_shows/src/models/seasonModel.dart';
import 'package:flutter_tv_shows/src/providers/tvShowProvider.dart';


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
            _appbar(seasonData),
            SliverList(
              delegate:SliverChildListDelegate(
                [ 
                  _seasonInfo(seasonData, context),
                  FutureBuilder(
                    future: seasonInfo,
                    builder: (context, AsyncSnapshot<SeasonModel> snapshot){
                      if(snapshot.hasData){
                        final season = snapshot.data;
                        return _episodesInfo(season,context,arg);                                   
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

  _appbar(SeasonModel season) {
        return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.purple,
      expandedHeight: 50.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          season.name,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        )
      ),
    );
  }

  _seasonInfo(SeasonModel season, BuildContext context) {
      return Container(
        margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
            Hero(
              tag: season.id,
              child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage( season.getPosterImg() ),
                height: 200.0,
              ),
            ),
            ),
        
          SizedBox(width: 20.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(season.name, style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold), ),
                Text(season.airDate,  style: TextStyle(fontSize: 17.0,color: Colors.black38),),
                
              ],
            ),
          )
        ],
      ),
    );

  }

  _episodesInfo(SeasonModel season, BuildContext context,dynamic arg) {

    final _screenSize = MediaQuery.of(context).size;

  return Container(
      margin: EdgeInsets.only(
        left: _screenSize.width*0.05,
        right: _screenSize.width*0.05,
        top: 10.0,
        bottom: 20.0
        ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 5.0,),
          Column(
            children: season.episodes.items.map((episode) { 
              final showItem = Container(
                margin: EdgeInsets.symmetric(vertical: 3.0),
                child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Stack(
            children:  <Widget>[
              FadeInImage(
                height: _screenSize.height*0.15,
                width: double.infinity,
                image: NetworkImage( episode.getStillImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover, 
              ),
              Container(
                height: _screenSize.height*0.15,
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
                  episode.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,fontSize: 20),
                    overflow: TextOverflow.ellipsis, // DOESN'T WORKD
                  ),
              )
            ]
            
          ),
        ),
      ); 
              return  GestureDetector(
                child: showItem,
                onTap: (){
                  print("me toca!!!");
                  Navigator.pushNamed(
                    context, 'episodeDetails',
                    arguments: {
                      "showId":arg["showId"],
                      "seasonNumber": arg["seasonNumber"],
                      "episode": episode
                      }
                  );
                },
              );
            }).toList(),
          )
      
          
        ],
      ),
    );


  }


}