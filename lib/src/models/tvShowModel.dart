import 'package:flutter_tv_shows/src/models/directorModel.dart';
import 'package:flutter_tv_shows/src/models/genreModel.dart';
import 'package:flutter_tv_shows/src/models/networkModel.dart';
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
  Networks networks;
  int numberOfEpisodes;
  int numberOfSeasons;
  List<dynamic> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  List<dynamic> productionCompanies;
  Seasons seasons;
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
    episodeRunTime      = json['episode_run_time'];
    firstAirDate        = json['first_air_date'];
    homepage            = json['homepage'];
    id                  = json['id'];
    inProduction        = json['in_production'];
    languages           = json['languages'];
    lastAirDate         = json['last_air_date'];
    name                = json['name'];
    nextEpisodeToAir    = json['next_episode_to_air'];
    numberOfEpisodes    = json['number_of_episodes'];
    numberOfSeasons     = json['number_of_seasons'];
    originCountry       = json['origin_country'];
    originalLanguage    = json['original_language'];
    originalName        = json['original_name'];
    overview            = json['overview'];
    popularity          = json['popularity'];
    posterPath          = json['poster_path'];
    productionCompanies = json['production_companies'];
    status              = json['status'];
    type                = json['type'];
    voteAverage         = json['vote_average']/1;
    voteCount           = json['vote_count'];
    genres              = Genres.fromJsonList(json['genres']);
    networks            = Networks.fromJsonList(json['networks']);
    seasons             = Seasons.fromJsonList(json['seasons']);
    director            = Directors.fromJsonList( json['created_by']) ;
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

  getNetworkdImage(int i) {
    if ( backdropPath == null ) {
      return 'https://www.oaxaca.gob.mx/consejeriajuridica/wp-content/uploads/sites/19/2019/05/no-photo.png';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    }
  }

}







