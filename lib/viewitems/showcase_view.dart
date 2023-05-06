import 'package:flutter/material.dart';
import 'package:movieapp_persistence/data/vos/movie_vo.dart';
import 'package:movieapp_persistence/network/api_constants.dart';
import 'package:movieapp_persistence/resources/dimens.dart';
import 'package:movieapp_persistence/widgets/play_button_view.dart';
import 'package:movieapp_persistence/widgets/title_text.dart';

class ShowCaseView extends StatelessWidget {
  final MovieVO? movie;
  ShowCaseView({required this.movie});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right:MARGIN_MEDIUM_2),
      width:300,
      child:Stack(
        children: [
          Positioned.fill(child:
          Image.network(
            "$IMAGE_BASE_URL${movie?.posterPath ?? ""}",
            fit: BoxFit.cover,),
          ),
          Align(
            alignment: Alignment.center,
            child: PlayButtonView(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
              child:Padding(
                padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie?.title ?? "",
                      style: TextStyle(
                          color : Colors.white,
                          fontSize: TEXT_REGULAR_3X,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height:MARGIN_SMALL,),
                    TitleText(movie?.releaseDate ?? "")
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}
