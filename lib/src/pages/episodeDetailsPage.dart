import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/episodeModel.dart';
import 'package:flutter_tv_shows/src/widgets/actorCard.dart';

class EpisodeDetailsPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
  final dynamic  args             = ModalRoute.of(context).settings.arguments;
  final  EpisodeModel episodeData =  args["episode"];         


  return Container(
      child: Scaffold(
        body:CustomScrollView(
          slivers:<Widget>[
            _appbar(episodeData),
            SliverList(
              delegate:SliverChildListDelegate(
                [ 
                  _showName(episodeData, context),
                  SizedBox(height: 20.0,),
                  _overviewInfo(episodeData,context),
                  _guestStarsInfo(episodeData,context)
                ] ,
            )
        )
          ]
      ),
    ),
    );
  }


  _appbar(EpisodeModel episode) {
        return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.purple,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: FadeInImage(
          image: NetworkImage( episode.getStillImg() ),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

    _showName(EpisodeModel episode,BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        left: _screenSize.width*0.05,
        right: _screenSize.width*0.05,
        top: 10.0
        ),
      child: Row(
        children: <Widget>[ 
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                  episode.name,
                  style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),
            ),
                  Text(
                    episode.airDate,
                  style: TextStyle(fontSize: 17.0,color: Colors.black38),

                  )
                ],
              ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    color: Colors.yellow,
                    icon: Icon(Icons.star),
                    iconSize: 30.0,
                    onPressed: (){}
                  ),
                  Container(
                    child: Text(
                      episode.voteAverage.toStringAsPrecision(2),
                      style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
                      ),
                  ),
                ],
              ),
            ],
            ),
        ]
      ),
    );
  }

    _overviewInfo(EpisodeModel episode, BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: _screenSize.width*0.05,
        right: _screenSize.width*0.05,
        top: 10.0
        ),
      child: Column(
        children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Overview",
            style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
            textAlign:TextAlign.left,)),
          SizedBox(height: 5.0,),
          Text(
            episode.overview,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15.0,color: Colors.black38),
            )
        ],
      ),
    );
  }

    _guestStarsInfo(EpisodeModel episode, BuildContext context) {
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