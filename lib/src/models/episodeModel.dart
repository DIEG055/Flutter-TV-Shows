class Episodes {
  List<EpisodeModel> items = new List();

  Episodes();
  Episodes.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;
    for ( var item in jsonList  ) {
      final season = new EpisodeModel.fromJsonMap(item);
      items.add( season );
    }

  }

}

class EpisodeModel {
  String airDate;
  int episodeNumber;
  int id;
  String name;
  String overview;
  String productionCode;
  int seasonNumber;
  int showId;
  String stillPath;
  double voteAverage;
  int voteCount;

  EpisodeModel({
    this.airDate,
    this.episodeNumber,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.seasonNumber,
    this.showId,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });

  EpisodeModel.fromJsonMap(Map<String, dynamic> json){
    airDate    = json['air_date'];
episodeNumber  = json['episode_number'];
id             = json['id'];
name           = json['name'];
overview       = json['overview'];
productionCode = json['production_code'];
seasonNumber   = json['season_number'];
showId         = json['show_id'];
stillPath      = json['still_path'];
voteAverage    = json['vote_average']/1;
voteCount      = json['vote_count'];
  }

  getStillImg() {
    if ( stillPath == null ) {
      return 'https://www.oaxaca.gob.mx/consejeriajuridica/wp-content/uploads/sites/19/2019/05/no-photo.png';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$stillPath';
    }
  }
}