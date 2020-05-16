class Networks {
  List<NetworkModel> items = new List();

  Networks();
  Networks.fromJsonList( List<dynamic> jsonList  ) {

  if ( jsonList == null ) return;
    for ( var item in jsonList  ) {
      final season = new NetworkModel.fromJsonMap(item);
      items.add( season );
    }
  }

}

class NetworkModel {
  String name;
  int id;
  String logoPath;
  String originCountry;

  NetworkModel({
    this.name,
    this.id,
    this.logoPath,
    this.originCountry,
  });

  NetworkModel.fromJsonMap(Map<String, dynamic> json){
    name          = json['name'];
    id            = json['id'];
    logoPath      = json['logo_path'];
    originCountry = json['origin_country'];
  }

  getLogoImg() {
    if ( logoPath == null ) {
      return 'https://www.oaxaca.gob.mx/consejeriajuridica/wp-content/uploads/sites/19/2019/05/no-photo.png';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$logoPath';
    }
  }
}