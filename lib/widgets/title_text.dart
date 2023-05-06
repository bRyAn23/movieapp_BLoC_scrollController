import 'package:flutter/material.dart';
import 'package:movieapp_persistence/resources/colors.dart';
import 'package:movieapp_persistence/resources/dimens.dart';

class TitleText extends StatelessWidget {
  final String text;
  TitleText(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style : TextStyle(
          color: HOME_SCREEN_LIST_TITLE_COLOR,
          fontSize: TEXT_REGULAR),
    );
  }
}
