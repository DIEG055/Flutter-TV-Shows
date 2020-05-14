
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
    id            = json['id'].cast<int>();
    logoPath      = json['logo_path'];
    originCountry = json['origin_country'];
  }

  getLogoImg() {
    if ( logoPath == null ) {
      return 'https://cdn11.bigcommerce.com/s-auu4kfi2d9/stencil/59512910-bb6d-0136-46ec-71c445b85d45/e/933395a0-cb1b-0135-a812-525400970412/icons/icon-no-image.svg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$logoPath';
    }
  }
}