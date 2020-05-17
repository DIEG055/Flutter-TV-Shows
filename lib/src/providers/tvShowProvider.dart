import 'dart:async';
import 'dart:convert';

import 'package:flutter_tv_shows/src/models/seasonModel.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_tv_shows/src/models/tvShowModel.dart';

class TvShowProvider{

  String _apikey   = '2eb3358970e273461c1bfc5ddcb41d43';
  String _url      = 'api.themoviedb.org';
  String _language = 'en-US';


  int _topRatedPage     = 0;
  bool _loadingTopRated = false; // avoid loading info multiple times
  //Stream
  List<TvShowModel> _topRated = new List();
  final _topRatedStreamController = StreamController<List<TvShowModel>>.broadcast();
  Function(List<TvShowModel>) get topRatedSink   => _topRatedStreamController.sink.add;
  Stream<List<TvShowModel>>   get topRatedStream => _topRatedStreamController.stream;

  
  int _airingTodayPage     = 0;
  bool _loadingAiringToday = false;
  //Stream
  List<TvShowModel> _airingToday     = new List();
  final _airingTodayStreamController = StreamController<List<TvShowModel>>.broadcast();
  Function(List<TvShowModel>) get airingTodaySink   => _airingTodayStreamController.sink.add;
  Stream<List<TvShowModel>>   get airingTodayStream => _airingTodayStreamController.stream;
  

  bool _loadingLatestShow = false;
  //Stream
  TvShowModel _latestShow    = new TvShowModel();
  final _latestShowStreamController = StreamController<TvShowModel>.broadcast();
  Function(TvShowModel) get latestShowSink   => _latestShowStreamController.sink.add;
  Stream<TvShowModel>   get latestShowStream => _latestShowStreamController.stream;


  void disposeStreams() {
    _topRatedStreamController?.close();
    _airingTodayStreamController?.close();
    _latestShowStreamController?.close();
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
    return response;
  }


  Future<List<TvShowModel>> getAiringTodayTvShows() async {
    if (_loadingAiringToday) {return [];}
    _airingTodayPage++;
    _loadingAiringToday= true;

    final url = Uri.https(_url, '3/tv/airing_today', {
      'api_key'  : _apikey,
      'language' : _language,
      'page'     : _airingTodayPage.toString(),
    });

    final response =  await _requestData(url);
    _airingToday.addAll(response);
    airingTodaySink(_airingToday);
    _loadingAiringToday=false;

    return response;
  }


  Future<TvShowModel> getLatestTvShow() async {
    if (_loadingLatestShow) {return new TvShowModel();}
    _loadingLatestShow= true;

    final url = Uri.https(_url, '3/tv/latest', {
      'api_key'  : _apikey,
      'language' : _language,
    });

    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);
    _latestShow = TvShowModel.fromJsonMap(decodedData);
    latestShowSink(_latestShow);
    _loadingLatestShow=false;
  return _latestShow;
  }


  Future<List<TvShowModel>> getPopularTvShows() async {
    final url = Uri.https(_url, '3/tv/popular', {
      'api_key'  : _apikey,
      'language' : _language,
    });
    return await _requestData(url);
  }


  Future<List<TvShowModel>> searchTvShowsByName(String name) async {
    final url = Uri.https(_url, '3/search/tv', {
      'api_key'  : _apikey,
      'page' : 1.toString(),
      'query'    : name
    });
    return await _requestData(url);
  }
  
  
  Future<TvShowModel> getTvShowById(int id) async {
    final url = Uri.https(_url, '3/tv/$id', {
      'api_key'  : _apikey,
      'language' : _language,
    });
    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);
    final show = TvShowModel.fromJsonMap(decodedData);
    return show;
  }


  Future<List<TvShowModel>> getSimilarTvShowById(int id) async {
    final url = Uri.https(_url, '3/tv/$id/similar', {
      'api_key'  : _apikey,
      'language' : _language,
      'page'     : 1.toString()
    });
    return await _requestData(url);
  }


  Future<SeasonModel> getSeasonById(int showId,int seasonId) async {
    final url = Uri.https(_url, '3/tv/$showId/season/$seasonId', {
      'api_key'  : _apikey,
      'language' : _language,
    });
    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);
    final season = SeasonModel.fromJsonMap(decodedData);
    return season;
  }


}