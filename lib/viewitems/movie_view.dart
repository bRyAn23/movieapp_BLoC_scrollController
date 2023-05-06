import 'package:flutter/material.dart';
import 'package:movieapp_persistence/data/vos/movie_vo.dart';
import 'package:movieapp_persistence/network/api_constants.dart';
import 'package:movieapp_persistence/resources/dimens.dart';
import 'package:movieapp_persistence/widgets/rating_view.dart';

class MovieView extends StatelessWidget {
  final MovieVO? movie;
  //late String movieTitle;
  MovieView({required this.movie}){
    //this.movieTitle = movie?.title ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: MARGIN_MEDIUM,
      ),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "$IMAGE_BASE_URL${movie?.posterPath ?? ""}",
            fit: BoxFit.cover,
            height: 200,
            width: 270,
          ),
          const SizedBox(height: MARGIN_MEDIUM,),
          Text(
            movie?.title ?? "",
            style : TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: MARGIN_MEDIUM,),
          Row(
            children: [
              Text(
                "8.9",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width:MARGIN_MEDIUM),
              RatingView(),
            ],
          )
        ],
      ),
    );
  }
}
