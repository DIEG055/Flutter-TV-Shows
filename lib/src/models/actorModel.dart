class Actors {
  List<ActorModel> items = new List();

  Actors();
  Actors.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;
    for ( var item in jsonList  ) {
      final season = new ActorModel.fromJsonMap(item);
      items.add( season );
    }
  }

}

class ActorModel {
  int id;
  String name;
  String creditId;
  String character;
  int order;
  int gender;
  String profilePath;

  ActorModel({
    this.id,
    this.name,
    this.creditId,
    this.character,
    this.order,
    this.gender,
    this.profilePath,
  });

  ActorModel.fromJsonMap(Map<String, dynamic> json){
    id          = json['id'];
    name        = json['name'];
    creditId    = json['credit_id'];
    character   = json['character'];
    order       = json['order'];
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
