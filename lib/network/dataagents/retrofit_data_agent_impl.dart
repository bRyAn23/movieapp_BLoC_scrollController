import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:movieapp_persistence/data/vos/actor_vo.dart';
import 'package:movieapp_persistence/data/vos/genre_vo.dart';
import 'package:movieapp_persistence/data/vos/movie_vo.dart';
import 'package:movieapp_persistence/network/api_constants.dart';
import 'package:movieapp_persistence/network/dataagents/movie_data_agent.dart';
import 'package:movieapp_persistence/network/the_movie_api.dart';

class RetrofitDataAgentImpl extends MovieDataAgent{

  late TheMovieApi mApi;


  //Singletone Pattern (3 steps needed)

  //1.delcare private constructor
  RetrofitDataAgentImpl._internal(){
    final dio = Dio();
    mApi = TheMovieApi(dio);
  }

  //2.Create Class level variable which define with private constructor(step 1)
  static RetrofitDataAgentImpl _singletone = RetrofitDataAgentImpl._internal();

  //3.Construct name constructor(factory constructor)
  //Factor constructor create one time and don't construct another time
  // when use another time
  factory RetrofitDataAgentImpl() {
    return _singletone;
  }

  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page){
    return mApi
        .getNowPlayingMovie(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<MovieVO>?> getPopularMovies(int page){
    return mApi
        .getPopularMovie(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<MovieVO>?> getTopRatedMovies(int page){
    return mApi
        .getTopRatedMovies(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  Future<List<GenreVO>?> getGenres(){
    return mApi
        .getGenres(API_KEY, LANGUAGE_EN_US)
        .asStream()
        .map((response) => response.genres)
        .first;
  }

  Future<List<MovieVO>?> getMoviesByGenre(int genreId){
    return mApi
        .getMovieByGenre(genreId.toString(),API_KEY, LANGUAGE_EN_US)
        .asStream()
        .map((response) => response.results)
        .first;
  }

  Future<List<ActorVO>?> getActors(int page){
    return mApi
        .getActors(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  Future<MovieVO?> getMovieDetail(int movieId){
    return mApi
        .getMovieDetail(movieId.toString(),API_KEY);
  }

  Future<List<List<ActorVO>?>> getCreditByMovie(int movieId){
    return mApi
        .getCreditByMovie(movieId.toString(),API_KEY)
        .asStream()
        .map((getCreditByMovieResponse)
          =>[getCreditByMovieResponse.cast,getCreditByMovieResponse.crew])
        .first;
  }
}