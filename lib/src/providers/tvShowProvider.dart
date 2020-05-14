import 'dart:async';
import 'dart:convert';

import 'package:flutter_tv_shows/src/models/tvShowModel.dart';
import 'package:http/http.dart' as http;

class TvShowProvider{

  String _apikey   = '2eb3358970e273461c1bfc5ddcb41d43';
  String _url      = 'api.themoviedb.org';
  String _language = 'en-US';


  int _topRatedPage     = 0;
  bool _loadingTopRated = false; // avoid loading info multiple times


  //Streams
  List<TvShowModel> _topRated = new List();
  final _topRatedStreamController = StreamController<List<TvShowModel>>.broadcast();
  Function(List<TvShowModel>) get topRatedSink => _topRatedStreamController.sink.add;
  Stream<List<TvShowModel>> get topRatedStream => _topRatedStreamController.stream;


  void disposeStreams() {
    _topRatedStreamController?.close();
  }



  Future<List<TvShowModel>> _requestData(Uri url) async {
    try {
    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);
    final tvShows = new TvShows.fromJsonList(decodedData['results']);
    return tvShows.items;
    } catch (e) {
      print("error ");
      return TvShows.fromJsonList(null).items;
    }
  }



  Future<List<TvShowModel>> getTopRatedTvShows() async {
    if (_loadingTopRated) {return [];}
    _topRatedPage++;
    _loadingTopRated= true;

    final url = Uri.https(_url, '3/tv/top_rated', {
      'api_key'  : _apikey,
      'language' : _language,
      'page'     : _topRatedPage.toString(),
    });

    final response =  await _requestData(url);
    _topRated.addAll(response);
    topRatedSink(_topRated);

    _loadingTopRated=false;
        print("topRated");
    return response;
  }



  Future<List<TvShowModel>> getPopularTvShows() async {
    final url = Uri.https(_url, '3/tv/popular', {
      'api_key'  : _apikey,
      'language' : _language,
    });
    print("populares");
    return await _requestData(url);
  }

}