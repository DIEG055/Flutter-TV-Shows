import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/tvShowModel.dart';
import 'package:flutter_tv_shows/src/providers/tvShowProvider.dart';

class ShowDetailspage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    
  final TvShowModel show = ModalRoute.of(context).settings.arguments;
  final TvShowProvider provider = TvShowProvider();
  final showInfo = provider.getTvShowById(show.id);

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
                  return SliverList(
                    delegate: SliverChildListDelegate(
                      [ _showName(show,context),
                        _showMainInfo(show,context),
                        _showDetailInfo(show,context),
                        SizedBox(height: 30.0),
                        _overviewinfo(show,context),
                    ]),
            );       
                }else{
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

  _showName(TvShowModel show,BuildContext context) {

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
            icon: Icon(Icons.favorite_border),
            iconSize: 30.0,
            onPressed: (){}
          )
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

  _overviewinfo(TvShowModel show, BuildContext context) {
  
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
            style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
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





}