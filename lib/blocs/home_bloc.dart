

import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:movieapp_persistence/data/models/movie_model.dart';
import 'package:movieapp_persistence/data/models/movie_model_impl.dart';
import 'package:movieapp_persistence/data/vos/actor_vo.dart';
import 'package:movieapp_persistence/data/vos/genre_vo.dart';
import 'package:movieapp_persistence/data/vos/movie_vo.dart';

class HomeBloc extends ChangeNotifier{
  ///Reactive Stream
  late List<MovieVO> mNowPlayingMoviesList;
  late List<MovieVO> mPopularMovieList;
  late List<MovieVO> mShowCaseMovieList;
  late List<GenreVO>? mGenreList;
  late List<ActorVO>? mActors;
  late List<MovieVO>? mMovieByGenreList;

  ///Page
  int pageForNowPlayingMovies = 1;

  ///Models (connect with Data Layer)
  MovieModel mMovieModel = MovieModelImpl();

  HomeBloc(){
    /// Now Playing Movies Database
    mMovieModel.getNowPlayingMoviesFromDatabase()
        .listen((movieList) {
      mNowPlayingMoviesList = movieList;
      notifyListeners();
    }).onError((error){});

    /// Popular Database
    mMovieModel.getPopularMoviesFromDatabase()
        .listen((movieList) {
      mPopularMovieList = movieList;
      notifyListeners();
    }).onError((error){});

    /// ShowCase Database
    mMovieModel.getTopRatedMoviesFromDatabase()
        .listen((movieList) {
      mShowCaseMovieList = movieList;
      notifyListeners();
    }).onError((error){});

    /// Genres Database
    mMovieModel.getGenres()
        .then((genreList) {
      mGenreList = genreList;

      ///Movie By Genre
      _getMovieByGenreAndRefresh(genreList?.first.id ?? 0);
    }).catchError((error){});

    /// Actor Network
    mMovieModel.getActors()
        .then((actorList) {
      mActors = actorList;
      notifyListeners();
    }).catchError((error){});

    /// Actor Database
    mMovieModel.getAllActorsFromDatabase()
        .then((actorList) {
      mActors = actorList;
    }).catchError((error){});
  }
  void onTapGenre(int genreId){
    _getMovieByGenreAndRefresh(genreId);
  }

  void _getMovieByGenreAndRefresh(int genreId){
    mMovieModel.getMoviesByGenre(genreId).then((movieByGenre){
      mMovieByGenreList = movieByGenre;
      notifyListeners();
    }).catchError((error){});
  }

  void onNowPlayngMovieListEndReached(){
    this.pageForNowPlayingMovies += 1;
    mMovieModel.getNowPlayingMovies(pageForNowPlayingMovies);
  }
}