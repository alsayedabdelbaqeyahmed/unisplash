import 'package:flutter/material.dart';
import 'package:photo_search_app/constants/animated_page-route.dart';
import 'package:photo_search_app/screens/home.dart';

import 'package:photo_search_app/widget/change_theme_button_widget.dart';

class HomeAppBarWidget extends StatelessWidget {
  final double? mainFontSize;
  final double? secondFontSize;
  final double? iconSize;

  const HomeAppBarWidget({
    Key? key,
    required this.mainFontSize,
    required this.secondFontSize,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.pushReplacement(
                context,
                AnimatedPageRoute(
                  beginDx: -10.0,
                  beginDy: -10.0,
                  endDx: 0.0,
                  endDy: 0.0,
                  curve: Curves.ease,
                  widget: Home(),
                  duration: Duration(seconds: 2),
                ),
              ),
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).primaryColor,
                size: iconSize,
              ),
            ),
            ChangeThemeButtonWidget(),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: size.width * 0.02),
          child: Text(
            'Unsplash',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: mainFontSize,
            ),
          ),
        ),
        SizedBox(height: size.height * .01),
        Padding(
          padding: EdgeInsetsDirectional.only(start: size.width * 0.02),
          child: Text(
            'Beautiful, free Photos.',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: secondFontSize,
            ),
          ),
        ),
      ],
    );
  }
}
