import 'dart:io';

import 'package:flutter_tv_shows/src/models/tvShowModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {

  static Database _database; 

  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if ( _database != null ) return _database; // Singleton
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path, 'ScansDB.db' );

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: ( Database db, int version ) async {
        await db.execute(
          'CREATE TABLE Favorites ('
          'id INTEGER PRIMARY KEY,'
          'name TEXT,'
          'backdrop_path TEXT,'
          'vote_average REAL'
          ')'
        );
      }
    );
  }

  addShow( TvShowModel show ) async {
    final db  = await database;
    print(show.toJson());
    final res = await db.insert('Favorites',  show.toJson() );
    return res;
  }

  Future<TvShows> getAllShows() async {
    final db  = await database;
    final res = await db.query('Favorites');
    final List<TvShowModel> list = res.isNotEmpty 
      ? res.map( (c) => TvShowModel.fromJsonMap(c)).toList()
      : [];
    final tvShows = TvShows();
    tvShows.items = list;
    return tvShows;
  }

  Future<bool> getShow(int id) async {
    final db  = await database;
    final res = await db.query('Favorites', where: 'id = ?', whereArgs: [id]);
        return res.isNotEmpty;
  }

  Future<int> deleteShow( int id ) async {
    final db  = await database;
    final res = await db.delete('Favorites', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAll() async {
    final db  = await database;
    final res = await db.rawDelete('DELETE FROM Favorites');
    return res;
  }

}