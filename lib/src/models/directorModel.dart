class Directors {

  List<DirectorModel> items = new List();

  Directors();
  Directors.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;
    for ( var item in jsonList  ) {
      final director = new DirectorModel.fromJsonMap(item);
      items.add( director );
    }
  }

}

class DirectorModel {
  int id;
  String creditId;
  String name;
  int gender;
  String profilePath;

  DirectorModel({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.profilePath,
  });

  DirectorModel.fromJsonMap(Map<String, dynamic> json){
    id          = json['id'];
    creditId    = json['credit_id'];
    name        = json['name'];
    gender      = json['gender'];
    profilePath = json['profile_path'];
  }

  getProfileImg() {
    if ( profilePath == null ) {
      return 'https://www.oaxaca.gob.mx/consejeriajuridica/wp-content/uploads/sites/19/2019/05/no-photo.png';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}