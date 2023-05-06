import 'package:flutter/material.dart';
import 'package:movieapp_persistence/network/api_constants.dart';
import 'package:movieapp_persistence/network/dataagents/movie_data_agent.dart';
import 'package:http/http.dart' as http;
// class HttpMovieDataAgentImpl extends MovieDataAgent{
//
//   @override
//   Future<List<MovieVO>?> getNowPlayingMovies(int page){
//     //Query Parameter Construction
//     Map<String, String> queryParameters ={
//       PARAM_API_KEY : API_KEY,
//       PARAM_LANGUAGE : LANGUAGE_EN_US,
//       PARAM_PAGE : page.toString()
//     };
//     //URL Construction
//     var uri = Uri.https(BASE_URL,ENDPOINT_GET_NOW_PLAYING,queryParameters);
//
//     //get the data from uri
//     // http.get(uri).then((value){
//     //   debugPrint("Now Playing Movie ======== ${value.body.toString()}");
//     // }).catchError((error){
//     //   debugPrint("Now Playing Movie ======== ${error.toString()}");
//     // });
//
//
//   }
// }