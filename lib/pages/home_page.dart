import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movieapp_persistence/blocs/home_bloc.dart';
import 'package:movieapp_persistence/data/models/movie_model.dart';
import 'package:movieapp_persistence/data/models/movie_model_impl.dart';
import 'package:movieapp_persistence/data/vos/actor_vo.dart';
import 'package:movieapp_persistence/data/vos/genre_vo.dart';
import 'package:movieapp_persistence/data/vos/movie_vo.dart';
import 'package:movieapp_persistence/pages/move_details_page.dart';
import 'package:movieapp_persistence/resources/colors.dart';
import 'package:movieapp_persistence/resources/dimens.dart';
import 'package:movieapp_persistence/resources/strings.dart';
import 'package:movieapp_persistence/viewitems/banner_view.dart';
import 'package:movieapp_persistence/viewitems/movie_view.dart';
import 'package:movieapp_persistence/viewitems/showcase_view.dart';
import 'package:movieapp_persistence/widgets/actors_and_creators_section_view.dart';
import 'package:movieapp_persistence/widgets/see_more_text.dart';
import 'package:movieapp_persistence/widgets/title_and_horizontal_movie_list_view.dart';
import 'package:movieapp_persistence/widgets/title_text.dart';
import 'package:movieapp_persistence/widgets/title_text_with_see_more_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
       create: (context) => HomeBloc(),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: PRIMARY_COLOR,
            title: const Center(
              child: Text(
                MAIN_SCREEN_APP_BAR_TITLE,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            leading: const Icon(
              Icons.menu,
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  right: MARGIN_MEDIUM_2,
                ),
                child: Icon(
                  Icons.search,
                ),
              ),
            ]),
        body: Container(
          color: HOME_SCREEN_BACKGROUND_COLOR,
          child: SingleChildScrollView(
            child: Column(children: [
              Selector<HomeBloc,List<MovieVO>>(
                selector: (context, bloc) => bloc.mPopularMovieList,
                builder: (context, PopularMovieList, child) => BannerSectionView(
                  movieList: PopularMovieList?.take(8)?.toList() ?? [],
                ),
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              Selector<HomeBloc,List<MovieVO>>(
                selector: (context, bloc) => bloc.mNowPlayingMoviesList,
                builder: (context, NowPlayingMoviesList, child)  =>  TitleAndHorizontalMovieListView(
                    OnTapMovie: (movieId)=> _navigateToMovieDetailScreen(context,movieId),
                    movieList: NowPlayingMoviesList, Title: BEST_POPULAR_FILMS_AND_SERIALS,
                  onListEndReached: (){
                      var bloc = Provider.of<HomeBloc>(context, listen: false);
                      bloc.onNowPlayngMovieListEndReached();
                  },
                  ),
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              CheckMovieShowTimeSectionView(),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              Selector<HomeBloc,List<GenreVO>?>(
                selector: (context, bloc) => bloc.mGenreList,
                builder: (context, genreList, child) => Selector<HomeBloc,List<MovieVO>?>(
                  selector: (context, bloc) => bloc.mMovieByGenreList,
                  builder: (context,movieByGenreList,child) =>
                  GenreSectionView(
                    OnTapMovie:
                        (movieId)=>_navigateToMovieDetailScreen(context, movieId),
                    genreList: genreList,
                    movieByGenre: movieByGenreList,
                    onChooseGenre: (genreId){
                      if(genreId != null){
                        HomeBloc bloc = Provider.of<HomeBloc>(context, listen: false);
                        bloc.onTapGenre(genreId);
                      }
                    }
                ),

                )

              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              Selector<HomeBloc,List<MovieVO>>(
                selector: (contxt,bloc) => bloc.mShowCaseMovieList,
                builder: (context, ShowcaseMovieList, child) => ShowCasesSectionView(
                topRatedMovies: ShowcaseMovieList),
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              Selector<HomeBloc,List<ActorVO>?>(
                selector: (context,bloc) => bloc.mActors,
              builder: (context, actorList, child) =>ActorsAndCreatorsSectionView(
                      titleText: BEST_ACTOR_TITLE,
                      seeMoreText: BEST_ACTOR_SEE_MORE,
                      actorsList: actorList),
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
            ]),
          ),
        ),
      ),
    );
  }
  void _navigateToMovieDetailScreen(BuildContext context, int? movieId) {
    if(movieId != null)
    {
      Navigator.push(context,MaterialPageRoute(
          builder: (context)=> MovieDetailsPage(movieId: movieId,)
      ));
    }

  }
}



class GenreSectionView extends StatelessWidget {
    const GenreSectionView({
      required this.OnTapMovie,
      required this.genreList,
      required this.movieByGenre,
      required this.onChooseGenre,
  });
  final List<GenreVO>? genreList;
  final List<MovieVO>? movieByGenre;
  final Function(int?) OnTapMovie;
  final Function(int?) onChooseGenre;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_2,),
          child: DefaultTabController(
              length: genreList?.length ?? 0,
              child: TabBar(
                  isScrollable: true,
                  indicatorColor :PLAY_BUTTON_COLOR,
                  unselectedLabelColor: HOME_SCREEN_LIST_TITLE_COLOR,
                  tabs: genreList
                      ?.map(
                        (genre)=> Tab(
                      child: Text(genre.name ?? "",),
                    ),
                  ).toList() ?? [],
                  onTap: (index)
                  {
                    onChooseGenre(genreList?[index].id ?? 0);
                  }
              ),
          ),
        ),
        Container(
          color:PRIMARY_COLOR,
          padding: EdgeInsets.only(
              top:MARGIN_MEDIUM_2,
            bottom: MARGIN_LARGE,
          ),
          child:HorizontalMovieListVIew(
              OnTapMovie: (movieId) => this.OnTapMovie(movieId),
              movieList: movieByGenre,
              onListEndReached: (){
                var bloc = Provider.of<HomeBloc>(context, listen: false);
                bloc.onNowPlayngMovieListEndReached();
              },
          ),
        ),
      ],
    );
  }
}

class CheckMovieShowTimeSectionView extends StatelessWidget {
  const CheckMovieShowTimeSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      margin: EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_2,
      ),
      height: SHOWTIME_SECTION_HEIGHT,
      padding: EdgeInsets.all(MARGIN_LARGE),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MAIN_SCREEN_CHECK_MOVIE_SHOWTIMES,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_HEADING_1x,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              SeeMoreText(MAIN_SCREEN_SEE_MORE, textColor: Colors.yellow),
            ],
          ),
          Spacer(),
          Icon(
            Icons.location_on_rounded,
            color: Colors.white,
            size: BANNER_PLAY_BUTTON_SIZE,
          ),
        ],
      ),
    );
  }
}



class ShowCasesSectionView extends StatelessWidget {
  final List<MovieVO>? topRatedMovies;
  const ShowCasesSectionView({
    required this.topRatedMovies
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: TitleTextWithSeeMoreView(
            SHOW_CASES_TITLE,
            SHOW_CASES_SEE_MORE,
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Container(
          height: SHOW_CASES_HEIGHT,
          child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left:MARGIN_MEDIUM_2,),
              children: topRatedMovies?.map(
                (topRatedMovie) => ShowCaseView(
                    movie: topRatedMovie))
            .toList() ?? [],
          ),
        ),
      ],
    );
  }
}




class BannerSectionView extends StatefulWidget {
  final List<MovieVO>? movieList;
  BannerSectionView({required this.movieList});
  @override
  State<BannerSectionView> createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  double _postion = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          child: PageView(
            onPageChanged: (page){
              setState((){//refresh widget rebuild nearest build method
                _postion = page.toDouble();
              });
            },
              children: widget.movieList?.map(
                  (movie) => BannerView(
                    movie: movie,
                  )
              ).toList() ?? [],
          //     [
          //   BannerView(),
          //   BannerView(),
          //   BannerView(),
          // ]
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        DotsIndicator(
          dotsCount: (widget.movieList?.length == 0)
              ? 1 : widget.movieList?.length ?? 1,//movieList inside widget
          position: _postion,
          decorator: DotsDecorator(
            color: HOME_SCREEN_BANNER_DOTS_INACTIVE_COLOR,
            activeColor: PLAY_BUTTON_COLOR,
          ),
        ),
      ],
    );
  }
}

