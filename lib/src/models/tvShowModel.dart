import 'package:flutter_tv_shows/src/models/directorModel.dart';
import 'package:flutter_tv_shows/src/models/episodeModel.dart';
import 'package:flutter_tv_shows/src/models/seasonModel.dart';


class TvShows {

  List<TvShowModel> items = new List();

  TvShows();

  TvShows.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final tvShow = new TvShowModel.fromJsonMap(item);
      items.add( tvShow );
    }

  }

}

class TvShowModel {
  String backdropPath;
  Directors director;
  List<dynamic> episodeRunTime;
  String firstAirDate;
  Genres genres;
  String homepage;
  int id;
  bool inProduction;
  List<dynamic> languages;
  String lastAirDate;
  dynamic lastEpisodeToAir;
  String name;
  dynamic nextEpisodeToAir;
  List<dynamic> networks;
  int numberOfEpisodes;
  int numberOfSeasons;
  List<dynamic> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  List<dynamic> productionCompanies;
  List<dynamic> seasons;
  String status;
  String type;
  double voteAverage;
  int voteCount;

  TvShowModel({
    this.backdropPath,
    this.director,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.seasons,
    this.status,
    this.type,
    this.voteAverage,
    this.voteCount,
  });

  TvShowModel.fromJsonMap(Map<String, dynamic> json ){
    backdropPath        = json['backdrop_path'];
    director            = Directors.fromJsonList( json['created_by']) ;
    episodeRunTime      = json['episode_run_time'];
    firstAirDate        = json['first_air_date'];
    genres               = Genres.fromJsonList(json['genres']);
    homepage            = json['homepage'];
    id                  = json['id'];
    inProduction        = json['in_production'];
    languages           = json['languages'];
    lastAirDate         = json['last_air_date'];
    // lastEpisodeToAir    = json['last_episode_to_air'];
    name                = json['name'];
    nextEpisodeToAir    = json['next_episode_to_air'];
    networks            = json['networks'];
    numberOfEpisodes    = json['number_of_episodes'];
    numberOfSeasons     = json['number_of_seasons'];
    originCountry       = json['origin_country'];
    originalLanguage    = json['original_language'];
    originalName        = json['original_name'];
    overview            = json['overview'];
    popularity          = json['popularity'];
    posterPath          = json['poster_path'];
    productionCompanies = json['production_companies'];
    // seasons             = json['seasons'];
    status              = json['status'];
    type                = json['type'];
    voteAverage         = json['vote_average']/1;
    voteCount           = json['vote_count'];
  }

  getPosterImage(){
    if ( posterPath == null ) {
      return 'https://www.oaxaca.gob.mx/consejeriajuridica/wp-content/uploads/sites/19/2019/05/no-photo.png';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }

  getBackdropImage() {
    if ( backdropPath == null ) {
      return 'https://www.oaxaca.gob.mx/consejeriajuridica/wp-content/uploads/sites/19/2019/05/no-photo.png';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    }
  }

}

class Genres{

  List<Genre> items = new List();
  Genres();
  Genres.fromJsonList(List<dynamic> jsonList){
    
    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final director = new Genre.fromJsonMap(item);
      items.add( director );
    }
  }

}


class Genre {
  int id;
  String name;

  Genre({
    this.id,
    this.name,
  });

  Genre.fromJsonMap(Map<String, dynamic> json){
    id   = json['id'];
    name = json['name']; 

  }
}





