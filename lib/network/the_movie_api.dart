import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:movieapp_persistence/data/vos/movie_vo.dart';
import 'package:movieapp_persistence/network/api_constants.dart';
import 'package:movieapp_persistence/network/responses/get_actors_response.dart';
import 'package:movieapp_persistence/network/responses/get_credits_by_movie_response.dart';
import 'package:movieapp_persistence/network/responses/get_genres_response.dart';
import 'package:movieapp_persistence/network/responses/movie_list_response.dart';

//File name for autogenerate implementation/concrete class
part 'the_movie_api.g.dart';
@RestApi(baseUrl: BASE_URL_DIO)
abstract class TheMovieApi{
  factory TheMovieApi(Dio dio) = _TheMovieApi;

  @GET(ENDPOINT_GET_NOW_PLAYING) //get the endpoint
  // Future datatype is response of network layer
  Future<MovieListResponse> getNowPlayingMovie(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page,
      ); //abstract function for API

  @GET(ENDPOINT_GET_TOP_RATED) //get the endpoint
  // Future datatype is response of network layer
  Future<MovieListResponse> getTopRatedMovies(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page,
      ); //abstract function for API

  @GET(ENDPOINT_GET_POPULAR) //get the endpoint
  // Future datatype is response of network layer
  Future<MovieListResponse> getPopularMovie(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page,
      ); //abstract function for API

  @GET(ENDPOINT_GET_GENRES) //get the endpoint
  // Future datatype is response of network layer
  Future<GetGenresResponse> getGenres(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language
      ); //abstract function for API

  @GET(ENDPOINT_GET_MOVIES_BY_GENRE) //get the endpoint
  // Future datatype is response of network layer
  Future<MovieListResponse> getMovieByGenre(
      @Query(PARAM_GENRE_ID) String genreId,
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language
      ); //abstract function for API

  @GET(ENDPOINT_GET_ACTOR) //get the endpoint
  // Future datatype is response of network layer
  Future<GetActorsResponse> getActors(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page,
      ); //abstract function for API

  //************************* Direct API Response
  @GET('$ENDPOINT_GET_MOVIE_DETAILS/{movie_id}') //get the endpoint
  // Future datatype is response of network layer
  Future<MovieVO> getMovieDetail(
      @Path("movie_id") String movieId,
      @Query(PARAM_API_KEY) String apiKey,
      ); //abstract function for API

  //*************************
  @GET("/3/movie/{movie_id}/credits") //get the endpoint
  // Future datatype is response of network layer
  Future<GetCreditByMovieReponse> getCreditByMovie(
      @Path("movie_id") String movieId,
      @Query(PARAM_API_KEY) String apiKey,
      ); //abstract function for API
}