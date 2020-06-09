import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/tvShowModel.dart';

class TvShowsSimilarShow extends StatelessWidget {

  final Future<List<TvShowModel>> showFuture;

  TvShowsSimilarShow({this.showFuture});


  @override
  Widget build(BuildContext context) {
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