import 'package:flutter/material.dart';
import 'package:movieapp_persistence/components/smart_list_view.dart';
import 'package:movieapp_persistence/data/vos/movie_vo.dart';
import 'package:movieapp_persistence/resources/dimens.dart';
import 'package:movieapp_persistence/resources/strings.dart';
import 'package:movieapp_persistence/viewitems/movie_view.dart';
import 'package:movieapp_persistence/widgets/title_text.dart';
class TitleAndHorizontalMovieListView extends StatelessWidget {
  final Function(int?) OnTapMovie;
  final List<MovieVO>? movieList;
  final String Title;
  final Function onListEndReached;
  TitleAndHorizontalMovieListView(
      {required this.OnTapMovie,required this.movieList, required this.Title, required this.onListEndReached});
  //final List<MovieVO>?  nowPlayingMovies;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: EdgeInsets.only(
          left: MARGIN_MEDIUM_2,
        ),
        child: TitleText(this.Title),
      ),
      SizedBox(
        height: MARGIN_MEDIUM,
      ),
      HorizontalMovieListVIew(
          OnTapMovie: (movieId) => this.OnTapMovie(movieId),
          movieList: this.movieList,
         onListEndReached: this.onListEndReached,
      ),
    ]);
  }
}

class HorizontalMovieListVIew extends StatelessWidget {
  final Function(int?) OnTapMovie;
  final List<MovieVO>? movieList;
  final Function onListEndReached;
  HorizontalMovieListVIew({
    required this.OnTapMovie,
    required this.movieList,
    required this.onListEndReached
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MOVIE_LIST_HEIGHT,
      child:
      // ListView.builder(
      //   padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
      //   itemCount: movieList?.length ?? 0,
      //   scrollDirection: Axis.horizontal,
      //   itemBuilder: (BuildContext context, int index) {
      //     return
      //       GestureDetector(
      //         onTap: ()=> OnTapMovie(movieList?[index].id),
      //         child: MovieView(
      //           movie: movieList?[index],
      //         ),
      //       );
      //   },
      // ),
      SmartHorizontalListView(
        padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
        itemCount: movieList?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return
            GestureDetector(
              onTap: ()=> OnTapMovie(movieList?[index].id),
              child: MovieView(
                movie: movieList?[index],
              ),
            );
        },
        onListEndReached: (){
          this.onListEndReached();
        },
      ),
    );
  }
}