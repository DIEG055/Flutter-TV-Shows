import 'dart:async';

import 'package:flutter_tv_shows/src/models/tvShowModel.dart';
import 'package:flutter_tv_shows/src/providers/dbProvider.dart';


class FavoritesBloc {

  static final FavoritesBloc _singleton = new FavoritesBloc._internal();

  factory FavoritesBloc() {
    return _singleton;
  }

  FavoritesBloc._internal() {
    getShows();
  }

  final _favoritesShowsController = StreamController<TvShows>.broadcast();
  Stream<TvShows> get favoritesShowsStream => _favoritesShowsController.stream;

  final _favoriteShowController = StreamController<bool>.broadcast();
  Stream<bool> get favoriteShowStream      => _favoriteShowController.stream;


  dispose() {
    _favoritesShowsController?.close();
    _favoriteShowController?.close();
  }

  getShows() async {
    _favoritesShowsController.sink.add( await DBProvider.db.getAllShows() );
  }

  getShow(int id) async{
    _favoriteShowController.sink.add( await DBProvider.db.getShow(id));
  }


  addShow( TvShowModel scan ) async{
    await DBProvider.db.addShow(scan);
    getShows();
  }

  deleteShow( int id ) async {
    DBProvider.db..deleteShow(id);
    getShows();
  }

  deleteAllShows() async {
    await DBProvider.db.deleteAll();
    getShows();
  }


}
