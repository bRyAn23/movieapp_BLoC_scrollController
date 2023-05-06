import 'package:flutter/material.dart';
import 'package:movieapp_persistence/data/vos/actor_vo.dart';
import 'package:movieapp_persistence/network/api_constants.dart';
import 'package:movieapp_persistence/resources/colors.dart';
import 'package:movieapp_persistence/resources/dimens.dart';

class ActorView extends StatelessWidget {
  final ActorVO actor;
  ActorView({required this.actor});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM,),
      width:MOVIE_LIST_ITEM_WIDTH,
      child: Stack(
        children:[
          Positioned.fill(child:
          ActorImageView(
              actorImage: this.actor?.profilePath ?? ""
          ),
          ),
          Padding(
            padding: const EdgeInsets.all(MARGIN_MEDIUM),
            child: Align(
              alignment: Alignment.topRight,
              child:FavoriteButtonView(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ActorNameAndLikeView(
                actorName: this.actor?.name ?? ""
            ),
          ),
        ],
      ),
    );
  }
}

class ActorImageView extends StatelessWidget {
 final String actorImage;
 ActorImageView({required this.actorImage});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$IMAGE_BASE_URL${actorImage ?? ""}",
      fit: BoxFit.cover,);
  }
}

class FavoriteButtonView extends StatelessWidget {
  const FavoriteButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite_border,
      color: Colors.white,
    );
  }
}

class ActorNameAndLikeView extends StatelessWidget {
  final String actorName;
  ActorNameAndLikeView({required this.actorName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM_2,
          vertical: MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
          this.actorName,
          style: TextStyle(
            color:Colors.white,
          fontWeight: FontWeight.w700,
            fontSize: TEXT_REGULAR,
          )),
          SizedBox(height:MARGIN_MEDIUM,),
          Row(
            children: [
              Icon(
                Icons.thumb_up,
                color: Colors.amber,
                size: MARGIN_CARD_MEDIUM_2,
              ),
              SizedBox(width: MARGIN_MEDIUM,),
             Text(
      "       YOU LIKE 13 MOVIES",
              style:TextStyle(color:HOME_SCREEN_LIST_TITLE_COLOR,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

