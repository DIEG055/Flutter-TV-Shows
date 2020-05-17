import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/bloc/favoritesBloc.dart';

import 'package:flutter_tv_shows/src/models/networkModel.dart';
import 'package:flutter_tv_shows/src/models/tvShowModel.dart';
import 'package:flutter_tv_shows/src/providers/tvShowProvider.dart';
import 'package:flutter_tv_shows/src/widgets/seasonCard.dart';

class ShowDetailspage extends StatefulWidget {

  @override
  _ShowDetailspageState createState() => _ShowDetailspageState();
}

class _ShowDetailspageState extends State<ShowDetailspage> {

  bool isFavorite = false;
  StreamSubscription<bool> streamSubscription;


  ondispose(){
  streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    
  final favoritesBloc    = new FavoritesBloc();
  final TvShowModel show = ModalRoute.of(context).settings.arguments;
  final provider         = TvShowProvider();
  final showInfo         = provider.getTvShowById(show.id);
  final similarShowsInfo = provider.getSimilarTvShowById(show.id);
  streamSubscription = favoritesBloc.favoriteShowStream.listen((value) {});
  favoritesBloc.getShow(show.id);
  streamSubscription.onData((data) {isFavorite = data;});



    return Container(
      child: Scaffold(
        body:CustomScrollView(
          slivers:<Widget>[
            _appbar(show),  
            FutureBuilder(
              future: showInfo,
              builder: (context, AsyncSnapshot<TvShowModel> snapshot){
                if(snapshot.hasData){
                  final show = snapshot.data;
                  print(show.backdropPath);
                  return SliverList(
                    delegate: SliverChildListDelegate(
                      [ _showName(show,favoritesBloc,context),
                        _showMainInfo(show,context),
                        _showDetailInfo(show,context),
                        SizedBox(height: 30.0),
                        _overviewInfo(show,context),
                        _nertworkInfo(show,context),
                        _seasonInfo(show,context),
                        _similarShowsInfo(similarShowsInfo, context)
                      ]
                    ),
                  );       
                }else{
                  print("no data");
                  return SliverList(
                    delegate: SliverChildListDelegate([Center(child: CircularProgressIndicator())])); 
                }
              }
            )
          ]
        )
      ),
    );
  }

  _appbar(TvShowModel show) {
        return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.purple,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          show.name,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage( show.getBackdropImage() ),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _showName(TvShowModel show,FavoritesBloc favoritesBloc,BuildContext context) {

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
              child: Text(
              show.name,
              style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
                  color: Colors.deepPurple,
                  icon: isFavorite? Icon(Icons.favorite): Icon(Icons.favorite_border) ,
                  iconSize: 30.0,
                  onPressed: (){
                    print(isFavorite);
                    isFavorite? favoritesBloc.deleteShow(show.id): favoritesBloc.addShow(show);
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  }
                ),
              
        ]
      ),
    );
  }

  _showMainInfo(TvShowModel show, BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        left: _screenSize.width*0.05,
        right: _screenSize.width*0.05,
        top: 10.0
        ),
      height: 75.0,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(
                show.originCountry[0],
                style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
                ),
              Text(
                "Country",
                style: TextStyle(fontSize: 15.0,color: Colors.black38),
                )
            ],
            ),
          ),
          VerticalDivider(
            color: Colors.purple,
            thickness: 3.0,
          ),
          Expanded(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(
                show.originalLanguage.toUpperCase(),
                style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
                ),
              Text(
                "Language",
                style: TextStyle(fontSize: 15.0,color: Colors.black38),
                )
            ],
            ),
          ),
          VerticalDivider(
            color: Colors.purple,
            thickness: 3.0
          ),
          Expanded(
              child: Column(
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
                      show.voteAverage.toString(),
                      style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
                      ),
                  ),
                ],
              ),
              Text(
                show.voteCount.toString(),
                style: TextStyle(fontSize: 15.0,color: Colors.black38),
                )
            ],
            ),
          ),
        ],
        ),
    );
  }

  _showDetailInfo(TvShowModel show, BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;
    Widget _info(String text,String content) {
      return Row(
        children: <Widget>[
          Expanded(
            child: Text(
            text,
            style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
            content,
            style: TextStyle(fontSize: 17.0, color: Colors.black38),
            ),
          ),
        ],
      
      );
    }

    return Container(
            margin: EdgeInsets.only(
        left: _screenSize.width*0.05,
        right: _screenSize.width*0.05,
        top: 15.0
        ),
      child: Column(children: <Widget>[
        _info("Creator:", show.director.items[0].name),
        SizedBox(height: 10.0,),
        _info("Genre:", show.genres.items[0].name),
        SizedBox(height: 10.0,),
        _info("First Episode:", show.firstAirDate)
      ],)
    );
  }

  _overviewInfo(TvShowModel show, BuildContext context) {
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
            show.overview,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15.0,color: Colors.black38),
            )
        ],
      ),
    );
  }

  _nertworkInfo(TvShowModel show, BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;
  _networkImage(NetworkModel network){
    return Container(
        // decoration: BoxDecoration(border: Border.all(width:1)),
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: FadeInImage(
        image: NetworkImage( network.getLogoImg()),
        placeholder: AssetImage('assets/img/no-image.jpg'),
        fit: BoxFit.scaleDown,
        ),
    );
  }
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
          "Networks",
          style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
          textAlign:TextAlign.left,)),
        SizedBox(height: 5.0,),
        SizedBox(
          height: _screenSize.height*0.05,
            child: PageView.builder(
            pageSnapping: false,
            controller: PageController(
              viewportFraction: 0.33,
              initialPage: 0
            ),
            itemCount: show.networks.items.length,
            itemBuilder: (context, i) =>_networkImage( show.networks.items[i]),
          ),
        ),
      ],
    ),
  );
  }

  _seasonInfo(TvShowModel show, BuildContext context) {
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
                    child: Text("Seasons", 
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
                      ),
                  ),
                  IconButton(
                    color: Colors.deepPurple,
                    icon: Icon(Icons.arrow_forward),
                    onPressed: (){
                // route
              },)
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
              itemCount: show.seasons.items.length,
              itemBuilder: (context, i) =>SeasonCard(context: context,  season:show.seasons.items[i],showId: show.id ),
            ),
          )
      ],)
    );
  }

  _similarShowsInfo(Future<List<TvShowModel>> showFuture, BuildContext context) {

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
          Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Similar",
            style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
            textAlign:TextAlign.left,)),
          SizedBox(height: 5.0,),
          FutureBuilder(
            future: showFuture,
            builder: (BuildContext context, AsyncSnapshot<List<TvShowModel>>  snapshot) {
              if(snapshot.hasData){
                final shows = snapshot.data;
                return Column(
                  children: shows.map((show) {
                  final showItem = Container(
                    margin: EdgeInsets.symmetric(vertical: 3.0),
                    child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Stack(
                children:  <Widget>[
                  FadeInImage(
                    height: _screenSize.height*0.15,
                    width: double.infinity,
                    image: NetworkImage( show.getBackdropImage()),
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
                      show.name,
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
            Navigator.pushNamed(context, 'tvShowDetails', arguments: show);
          },
    );
      }).toList(),
        );
      }else{
        return Container(
        height: 400.0,
        child: Center(
          child: CircularProgressIndicator()
        )
      );
      }
            },
            ),
        ],
      ),
    );
  }
}