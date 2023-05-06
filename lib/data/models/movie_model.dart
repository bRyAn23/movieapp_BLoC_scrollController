//Data Manipulator
import 'package:movieapp_persistence/data/vos/actor_vo.dart';
import 'package:movieapp_persistence/data/vos/genre_vo.dart';
import 'package:movieapp_persistence/data/vos/movie_vo.dart';

abstract class MovieModel{

  //FromNetwork
  void getNowPlayingMovies(int page);
  void getPopularMovies(int page);
  void getTopRatedMovies(int page);
  Future<List<GenreVO>?> getGenres();
  Future<List<MovieVO>?> getMoviesByGenre(int genreId);
  Future<List<ActorVO>?> getActors();
  Future<MovieVO?> getMovieDetails(int movieId);
  Future<List<List<ActorVO>?>> getCreditByMovie(int movieId);

  //FromDatabase
  Stream<List<MovieVO>>  getNowPlayingMoviesFromDatabase();
  Stream<List<MovieVO>> getPopularMoviesFromDatabase();
  Stream<List<MovieVO>> getTopRatedMoviesFromDatabase();
  Future<List<GenreVO>> getGenresFromDatabase();
  Future<List<MovieVO>> getMoviesByGenreFromDatabase();
  Future<List<ActorVO>> getAllActorsFromDatabase();
  Future<MovieVO> getMovieDetailsFromDatabase(int movieId);
}