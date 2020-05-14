
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
episodeNumber  = json['episode_number'].cast<int>();
id             = json['id'].cast<int>();
name           = json['name'];
overview       = json['overview'];
productionCode = json['production_code'];
seasonNumber   = json['season_number'];
showId         = json['show_id'].cast<int>();
stillPath      = json['still_path'].cast<int>();
voteAverage    = json['vote_average']/1;
voteCount      = json['vote_count'].cast<int>();
  }

  getStillImg() {
    if ( stillPath == null ) {
      return 'https://cdn11.bigcommerce.com/s-auu4kfi2d9/stencil/59512910-bb6d-0136-46ec-71c445b85d45/e/933395a0-cb1b-0135-a812-525400970412/icons/icon-no-image.svg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$stillPath';
    }
  }
}