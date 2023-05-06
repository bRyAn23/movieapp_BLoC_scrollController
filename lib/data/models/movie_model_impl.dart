import 'package:movieapp_persistence/data/models/movie_model.dart';
import 'package:movieapp_persistence/data/vos/actor_vo.dart';
import 'package:movieapp_persistence/data/vos/genre_vo.dart';
import 'package:movieapp_persistence/data/vos/movie_vo.dart';
import 'package:movieapp_persistence/network/dataagents/movie_data_agent.dart';
import 'package:movieapp_persistence/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:movieapp_persistence/persistance/daos/actor_dao.dart';
import 'package:movieapp_persistence/persistance/daos/genre_dao.dart';
import 'package:movieapp_persistence/persistance/daos/movie_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class MovieModelImpl extends MovieModel{

  MovieModelImpl._internal();
  static MovieModelImpl _singleton = MovieModelImpl._internal();
  factory MovieModelImpl(){
    return _singleton;
  }

  // Network Data Agent
  MovieDataAgent _dataAgent = RetrofitDataAgentImpl();

  //Local Database Agent
  MovieDao mMovieDao = MovieDao();
  ActorDao mActorDao = ActorDao();
  GenreDao mGenreDao = GenreDao();

  //Network Operations
  @override
  void getNowPlayingMovies(int page) {
    _dataAgent.getNowPlayingMovies(page).then((movies) async{
      List<MovieVO> nowPlayingMovies = (movies??[]).map((movie){
        movie.isNowPlaying = true;
        movie.isTopRated = false;
        movie.isPopular = false;
        return movie;
      }).toList();
      mMovieDao.saveMovie(nowPlayingMovies);
    });
  }

  @override
  void getPopularMovies(int page) {
    _dataAgent.getPopularMovies(page).then((movies) async{
      List<MovieVO> popularMovie = movies?.map((movie){
        movie.isNowPlaying = false;
        movie.isTopRated = false;
        movie.isPopular = true;
        return movie;
      }).toList() ?? [];
      mMovieDao.saveMovie(popularMovie);
    });
  }

  @override
  void getTopRatedMovies(int page) {
    _dataAgent.getTopRatedMovies(page).then((movies) async{
      List<MovieVO> topRatedMovie = (movies??[]).map((movie){
        movie.isNowPlaying = false;
        movie.isTopRated = true;
        movie.isPopular = false;
        return movie;
      }).toList();
      mMovieDao.saveMovie(topRatedMovie);
    });
  }

  @override
  Future<List<GenreVO>?> getGenres() {
    return _dataAgent.getGenres().then((genres) async{
     mGenreDao.saveAllGenres(genres??[]);
     return genres;
    });
  }

  @override
  Future<List<MovieVO>?> getMoviesByGenre(int genreId) {
    return _dataAgent.getMoviesByGenre(genreId);
  }

  @override
  Future<List<ActorVO>?> getActors() {
    return _dataAgent.getActors(1).then((actors) async{
      mActorDao.saveAllActors(actors??[]);
      return Future.value(actors);
    });
  }

  @override
  Future<MovieVO?> getMovieDetails(int movieId) {
    return _dataAgent.getMovieDetail(movieId).then((movie){
      if(movie != null){
        mMovieDao.saveSingleMovie(movie);
      }
      return Future.value(movie);
    }
    );
  }

  @override
  Future<List<List<ActorVO>?>> getCreditByMovie(int movieId) {
    return _dataAgent.getCreditByMovie(movieId);
  }

  //Database Operations
  Stream<List<MovieVO>> getNowPlayingMoviesFromDatabase(){
    this.getNowPlayingMovies(1); //Fetch Data from network and fill in persistence
    return mMovieDao
    .getAllMoviesEventStream() //First Stream
    .startWith(mMovieDao.getNowPlayingMoviesStream())//show default in persistence
    .map((event) => mMovieDao.getNowPlayingMovies());
    //     //.map((event) => mMovieDao.getNowPlayingMovies());
    //  .combineLatest(mMovieDao.getNowPlayingMoviesStream(), // Second Stream
    //      (event, movieList) => movieList as List<MovieVO>) // Combine
    // .first;
  }
  Stream<List<MovieVO>> getPopularMoviesFromDatabase(){
    this.getPopularMovies(1);
    return mMovieDao
        .getAllMoviesEventStream() //First Stream emit data to event
        .startWith(mMovieDao.getPopularMoviesStream()) //show default in persistence
        .map((event) => mMovieDao.getPopularMovies());
        // .combineLatest(mMovieDao.getPopularMoviesStream(), // Second Stream emit data to movieList
        //  (event, movieList) => movieList as List<MovieVO>) // Combine
        // .first;
  }
  Stream<List<MovieVO>> getTopRatedMoviesFromDatabase(){
    this.getTopRatedMovies(1);
    return mMovieDao
        .getAllMoviesEventStream() //First Stream
        .startWith(mMovieDao.getTopRatedMoviesStream())//show default in persistence
        .map((event) => mMovieDao.getTopRatedMovies());
        // .combineLatest(mMovieDao.getTopRatedMoviesStream(),// Second Stream
        //     (event, movieList) => movieList as List<MovieVO>) // Combine
        // .first;
  }
  Future<List<GenreVO>> getGenresFromDatabase(){
    return Future.value(mGenreDao.getAllGenres());
  }
  Future<List<MovieVO>> getMoviesByGenreFromDatabase(){
    return Future.value(mMovieDao.getAllMovie());
  }
  Future<List<ActorVO>> getAllActorsFromDatabase(){
    return Future.value(mActorDao.getAllActors());
  }

  Future<MovieVO> getMovieDetailsFromDatabase(int movieId){
    return Future.value(mMovieDao.getMovieById(movieId));
  }
}