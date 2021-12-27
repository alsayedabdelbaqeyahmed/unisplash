import 'package:flutter/material.dart';
import 'package:photo_search_app/constants/animated_page-route.dart';
import 'package:photo_search_app/home.dart';
import 'package:photo_search_app/providers/dark_theme.dart';
import 'package:photo_search_app/providers/myTheme.dart';
import 'package:photo_search_app/widget/change_theme_button_widget.dart';
import 'package:provider/provider.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                color: MyThemes.fontColor(context),
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
              color: MyThemes.fontColor(context),
              fontSize: size.width * 0.07,
            ),
          ),
        ),
        SizedBox(height: size.height * .01),
        Padding(
          padding: EdgeInsetsDirectional.only(start: size.width * 0.02),
          child: Text(
            'Beautiful, free Photos.',
            style: TextStyle(
              color: MyThemes.fontColor(context),
              fontSize: size.width * 0.03,
            ),
          ),
        ),
      ],
    );
  }
}
