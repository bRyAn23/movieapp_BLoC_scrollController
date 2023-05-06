import 'package:flutter/material.dart';
import 'package:movieapp_persistence/data/vos/actor_vo.dart';
import 'package:movieapp_persistence/resources/colors.dart';
import 'package:movieapp_persistence/resources/dimens.dart';
import 'package:movieapp_persistence/widgets/title_text_with_see_more_view.dart';

import '../resources/strings.dart';
import 'actor_item_view.dart';

class ActorsAndCreatorsSectionView extends StatelessWidget {
  final String titleText;
  final String seeMoreText;
  final bool seeMoreButtonVisibility;
  final List<ActorVO>? actorsList;
  ActorsAndCreatorsSectionView(
      {required this.titleText,required this.seeMoreText,required this.actorsList,
      this.seeMoreButtonVisibility = true});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      padding: EdgeInsets.only(
        top: MARGIN_MEDIUM_2,
        bottom:MARGIN_XXLARGE,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: TitleTextWithSeeMoreView(
              titleText,
              seeMoreText,
              seeMoreButtonVisibility: this.seeMoreButtonVisibility,
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM_2,
          ),
          Container(
            height: BEST_ACTORS_HEIGHT,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
              children: this.actorsList?.map(
                      (actor) => ActorView(
                    actor: actor,
                  )
              ).toList() ?? [],
              // children: [
              //   ActorView(),
              //   ActorView(),
              //   ActorView(),
              // ],
            ),
          ),
        ],
      ),
    );
  }
}