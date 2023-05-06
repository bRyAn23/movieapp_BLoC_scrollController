
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:movieapp_persistence/data/models/movie_model.dart';
import 'package:movieapp_persistence/data/models/movie_model_impl.dart';
import 'package:movieapp_persistence/data/vos/actor_vo.dart';
import 'package:movieapp_persistence/data/vos/movie_vo.dart';

class MovieDetailsBloc extends ChangeNotifier{
  /// Stream Controllers
  late MovieVO? mMovie;
  late List<ActorVO>? mCreators;
  late List<ActorVO>? mActors;
  late List<MovieVO>? mRelatedMovies;

  ///Model
  MovieModel mMovieModel = MovieModelImpl();

  MovieDetailsBloc(int movieId){
    ///MovieDetails
    mMovieModel.getMovieDetails(movieId).then((movie){
      this.mMovie = movie;
      this.getRelatedMovie(movie?.genres?.first.id ?? 0);
      notifyListeners();
    }).catchError((error){});

    ///MovieDetails
    mMovieModel.getMovieDetailsFromDatabase(movieId).then((movie){
      this.mMovie = movie;
      notifyListeners();
    }).catchError((error){});

    ///Creator
    mMovieModel.getCreditByMovie(movieId).then((creditsList){
      mCreators = creditsList[1];
      mActors = creditsList.first;
      notifyListeners();
    }).catchError((error){});
  }

  void getRelatedMovie(int genreId){
    mMovieModel.getMoviesByGenre(genreId)?.then((relatedMovies){
      mRelatedMovies = relatedMovies;
      notifyListeners();
    });
  }
}