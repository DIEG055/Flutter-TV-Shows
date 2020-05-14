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
  List<EpisodeModel> episodes;

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
    airDate  = json['airDate'];
    episodeCount = json['episode_count'].cast<int>();
    id           = json['id'].cast<int>();
    name         = json['name'];
    overview     = json['overview'];
    posterPath   = json['poste_path'];
    seasonNumber = json['season_number'].cast<int>();
    episodes    = json['episodes'];
  }

  getPosterImg() {
    if ( posterPath == null ) {
      return 'https://cdn11.bigcommerce.com/s-auu4kfi2d9/stencil/59512910-bb6d-0136-46ec-71c445b85d45/e/933395a0-cb1b-0135-a812-525400970412/icons/icon-no-image.svg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }
}
