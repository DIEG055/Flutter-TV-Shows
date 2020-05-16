import 'package:flutter/material.dart';
import 'package:flutter_tv_shows/src/models/tvShowModel.dart';
import 'package:flutter_tv_shows/src/providers/tvShowProvider.dart';
import 'package:flutter_tv_shows/src/widgets/searchListItem.dart';


class DataSearch extends SearchDelegate {

  String seleccion = '';
  final tvShowProvider = new TvShowProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon( Icons.clear ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        color: Colors.purple,
      ),
      onPressed: (){
        close( context, null );// cierra la busqueda
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe
    if ( query.isEmpty ) {
      return Container();
    }
    return FutureBuilder(
      future: tvShowProvider.searchTvShowsByName(query),
      builder: (BuildContext context, AsyncSnapshot<List<TvShowModel>> snapshot) {
          if( snapshot.hasData ) {
            final shows = snapshot.data;
            return ListView(
              children: shows.map( (show) {
                return SearchCard(show: show);
              }).toList()
            );

          } else {
            return Center(
              child: CircularProgressIndicator()
            );
          }

      },
    );


  }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   // Son las sugerencias que aparecen cuando la persona escribe

  //   final listaSugerida = ( query.isEmpty ) 
  //                           ? peliculasRecientes
  //                           : peliculas.where( 
  //                             (p)=> p.toLowerCase().startsWith(query.toLowerCase()) 
  //                           ).toList();


  //   return ListView.builder(
  //     itemCount: listaSugerida.length,
  //     itemBuilder: (context, i) {
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(listaSugerida[i]),
  //         onTap: (){
  //           seleccion = listaSugerida[i];
  //           showResults( context );
  //         },
  //       );
  //     },
  //   );
  // }

}

