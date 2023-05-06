
import 'package:hive/hive.dart';
import 'package:movieapp_persistence/data/vos/movie_vo.dart';
import 'package:movieapp_persistence/persistance/hive_constants.dart';

class MovieDao{

  //Singleton
  static final MovieDao _singleton = MovieDao._internal();

  factory MovieDao(){
    return _singleton;
  }

  MovieDao._internal();

  //Open Box
  Box<MovieVO> getMovieBox() {
    return Hive.box<MovieVO>(BOX_NAME_MOIVE_VO);
  }

  //Save All Movie
  void saveMovie(List<MovieVO> movies) async {
    Map<int, MovieVO> movieMap = Map.fromIterable(movies,
    key: (movie) => movie.id, value: (moive) => moive);
    await getMovieBox().putAll(movieMap);
  }

  //Save Single Movie
  void saveSingleMovie(MovieVO movie) async {
      await getMovieBox().put(movie.id,movie);
  }

  //getAllMovie
  List<MovieVO> getAllMovie() {
    List<MovieVO> movieListFromDB = getMovieBox().values.toList();
    return movieListFromDB;
  }

  //Get Movie By ID ==> with get(parameter key);
  MovieVO? getMovieById(int movieId)
  {
    return getMovieBox().get(movieId);
  }

  ///Reactive Programming
  ////Data Change watch and go to listen callback
  Stream<void> getAllMoviesEventStream(){
    return getMovieBox().watch();
  }

  Stream<List<MovieVO>> getNowPlayingMoviesStream(){
    return Stream.value(
      getAllMovie().where((element) => element?.isNowPlaying == true ?? false)
          .toList()
      );
  }

  Stream<List<MovieVO>> getPopularMoviesStream(){
    return Stream.value(
        getAllMovie().where((element) => element?.isPopular == true ?? false)
            .toList()
    );
  }

  Stream<List<MovieVO>> getTopRatedMoviesStream(){
    return Stream.value(
        getAllMovie().where((element) => element?.isTopRated == true ?? false)
            .toList()
    );
  }

  List<MovieVO> getNowPlayingMovies(){
    if(getAllMovie()!=null && (getAllMovie().isNotEmpty ?? false)) {
        return getAllMovie()
            .where((element) => element?.isNowPlaying ?? false)
            .toList();
      }
    else{
      return [];
    }
  }

  List<MovieVO> getPopularMovies(){
    if(getAllMovie()!=null && (getAllMovie().isNotEmpty ?? false)) {
      return getAllMovie()
          .where((element) => element?.isPopular ?? false)
          .toList();
    }
    else{
      return [];
    }
  }

  List<MovieVO> getTopRatedMovies(){
    if(getAllMovie()!=null && (getAllMovie().isNotEmpty ?? false)) {
      return getAllMovie()
          .where((element) => element?.isTopRated ?? false)
          .toList();
    }
    else{
      return [];
    }
  }

}