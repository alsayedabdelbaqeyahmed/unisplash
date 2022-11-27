import 'package:flutter/material.dart';
import 'package:photo_search_app/presentation/router/app_routes_const.dart';

import 'package:photo_search_app/presentation/views/widget/photo_screen_widget.dart';

class PhotoScreen extends StatelessWidget {
  static const routeNamess = AppRouteConstants.photoViewer;
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final islandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrain) {
          return islandScape
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      PhotoScreenWidget(
                        appBarSizedBox: constrain.maxHeight * 0.03,
                        crossAxissAccount: 4,
                        childAspectRatio: constrain.maxWidth * 0.001,
                        crossAxisSpacing: constrain.maxWidth * 0.002,
                        mainAxisSpacing: constrain.maxWidth * 0.02,
                        searchBarSizedBox: constrain.maxHeight * 0.045,
                        shrankWrap: true,
                        iconSize: constrain.maxWidth * 0.045,
                        mainFontSize: constrain.maxWidth * 0.04,
                        secondFontSize: constrain.maxWidth * 0.02,
                      ),
                    ],
                  ),
                )
              : PhotoScreenWidget(
                  appBarSizedBox: constrain.maxHeight * 0.015,
                  crossAxissAccount: 2,
                  childAspectRatio: constrain.maxHeight * 0.0009,
                  crossAxisSpacing: constrain.maxHeight * 0.009,
                  mainAxisSpacing: constrain.maxHeight * 0.02,
                  searchBarSizedBox: constrain.maxHeight * 0.02,
                  shrankWrap: false,
                  iconSize: constrain.maxHeight * 0.03,
                  mainFontSize: constrain.maxHeight * 0.04,
                  secondFontSize: constrain.maxHeight * 0.02,
                );
        },
      ),
    );
  }
}
