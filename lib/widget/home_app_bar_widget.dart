import 'package:flutter/material.dart';
import 'package:photo_search_app/constants/animated_page-route.dart';
import 'package:photo_search_app/home.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: size.width * 0.02),
          child: Text(
            'Unsplash',
            style: TextStyle(
              color: Colors.white,
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
              color: Colors.white,
              fontSize: size.width * 0.03,
            ),
          ),
        ),
      ],
    );
  }
}
