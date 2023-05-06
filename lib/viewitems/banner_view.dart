import 'package:flutter/material.dart';
import 'package:movieapp_persistence/data/vos/movie_vo.dart';
import 'package:movieapp_persistence/network/api_constants.dart';
import 'package:movieapp_persistence/resources/dimens.dart';
import 'package:movieapp_persistence/resources/colors.dart';
import 'package:movieapp_persistence/widgets/graddient_view.dart';
import 'package:movieapp_persistence/widgets/play_button_view.dart';
class BannerView extends StatelessWidget {
  final MovieVO? movie;
  BannerView({this.movie});
  //const BannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BannerImageView(
            image: this.movie?.posterPath ?? ""
          ),
        ),
        Positioned.fill(
          child: GradientView(),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: BannerTitleView(
            title: this.movie?.originalTitle ?? ""
          ),
        ),
        Align(
          alignment: Alignment.center,
          child:PlayButtonView(),
        )
      ],
    );
  }
}





class BannerTitleView extends StatelessWidget {
  final String title;
  const BannerTitleView({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "Official Review",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.w500,
          ),
        ),
      ]),
    );
  }
}

class BannerImageView extends StatelessWidget {
  final String image;
  const BannerImageView({
   required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$IMAGE_BASE_URL${image ?? ""}",
      fit: BoxFit.cover,
    );
  }
}
