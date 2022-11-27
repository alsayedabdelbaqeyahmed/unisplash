import 'package:flutter/material.dart';
import 'package:photo_search_app/presentation/router/app_routes_const.dart';
import 'package:photo_search_app/presentation/style/app_assets.dart';
import 'package:photo_search_app/presentation/style/app_string.dart';
import 'package:photo_search_app/presentation/views/shared_widget.dart/animated_page-route.dart';
import 'package:photo_search_app/presentation/views/screens/photo_screen.dart';

class Home extends StatelessWidget {
  static const routeNames = AppRouteConstants.home;
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textSize = MediaQuery.of(context).textScaleFactor;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      body: LayoutBuilder(builder: (context, constrain) {
        return SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: constrain.maxHeight,
                width: constrain.maxWidth,
                child: Image(
                  image: AssetImage(AppAssets.unsplash),
                  fit: BoxFit.cover,
                ),
              ),
              if (!isLandScape)
                Positioned(
                  top: size.height * 0.65,
                  left: size.width * 0.08,
                  child: Text(
                    AppStrings.creation,
                    style: TextStyle(
                      fontSize: size.height * 0.04 * textSize,
                      color: const Color(0xffE0F2F1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              isLandScape
                  ? positioned(
                      positinedTop: constrain.maxHeight * 0.8,
                      positinedRight: constrain.maxWidth * 0.1,
                      size: size,
                      context: context,
                      fontSize: constrain.maxWidth * 0.04,
                      iconSize: constrain.maxWidth * 0.06,
                    )
                  : positioned(
                      positinedTop: constrain.maxHeight * 0.8,
                      positinedLeft: constrain.maxWidth * 0.58,
                      size: size,
                      context: context,
                      fontSize: constrain.maxHeight * 0.035,
                      iconSize: constrain.maxHeight * 0.055,
                    ),
            ],
          ),
        );
      }),
    );
  }

  Positioned positioned({
    required Size size,
    BuildContext? context,
    double? positinedTop,
    double? positinedRight,
    double? positinedLeft,
    double? fontSize,
    double? iconSize,
  }) {
    return Positioned(
      top: positinedTop,
      right: positinedRight,
      left: positinedLeft,
      child: TextButton(
        onPressed: () => Navigator.pushReplacement(
          context!,
          AnimatedPageRoute(
            beginDx: 10.0,
            beginDy: 10.0,
            endDx: 0.0,
            endDy: 0.0,
            curve: Curves.ease,
            widget: PhotoScreen(),
            duration: Duration(seconds: 1),
          ),
        ),
        child: Row(
          children: [
            Text(
              AppStrings.start,
              style: TextStyle(
                fontSize: fontSize,
                color: const Color(0xffFFFFFF),
              ),
            ),
            SizedBox(width: size.width * 0.03),
            Icon(
              Icons.camera,
              size: iconSize,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
