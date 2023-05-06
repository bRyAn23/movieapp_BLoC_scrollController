import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:movieapp_persistence/network/dataagents/movie_data_agent.dart';
import '../api_constants.dart';

// class DioMovieDataAgentImpl extends MovieDataAgent{
//   Future<List<MovieVO>?> getNowPlayingMovies(int page){
//     //Query Parameter Construction
//     Map<String, String> queryParameters ={
//       PARAM_API_KEY : API_KEY,
//       PARAM_LANGUAGE : LANGUAGE_EN_US,
//       PARAM_PAGE : page.toString()
//     };
//     Dio().get("$BASE_URL_DIO$ENDPOINT_GET_NOW_PLAYING", queryParameters: queryParameters).then((value){
//       debugPrint("Now Playing Movie ======== ${value.toString()}");
//     }).catchError((error){
//       debugPrint("Now Playing Movie ======== ${error.toString()}");
//     });
//   }
// }