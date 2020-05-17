import 'package:flutter_tv_shows/src/models/episodeModel.dart';

class Seasons {

  List<SeasonModel> items = new List();

  Seasons();
  Seasons.fromJsonList( List<dynamic> jsonList  ) {

  if ( jsonList == null ) return;
    for ( var item in jsonList  ) {
      final season = new SeasonModel.fromJsonMap(item);
      items.add( season );
    }
  }

}

class SeasonModel {
  String airDate;
  int episodeCount;
  int id;
  String name;
  String overview;
  String posterPath;
  int seasonNumber;
  Episodes episodes;

  SeasonModel({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
    this.episodes
  });

  SeasonModel.fromJsonMap(Map<String, dynamic> json ){
    airDate      = json['air_date'];
    id           = json['id'];
    name         = json['name'];
    overview     = json['overview'];
    posterPath   = json['poster_path'];
    seasonNumber = json['season_number'];
    episodes     = Episodes.fromJsonList(json['episodes']);
    episodeCount = episodes.items.length;
  }

  getPosterImg() {
    if ( posterPath == null ) {
      return 'https://www.oaxaca.gob.mx/consejeriajuridica/wp-content/uploads/sites/19/2019/05/no-photo.png';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }
}
