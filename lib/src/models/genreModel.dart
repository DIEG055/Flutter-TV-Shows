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