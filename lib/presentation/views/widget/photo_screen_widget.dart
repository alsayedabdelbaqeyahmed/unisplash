// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_search_app/domain/entities/photo_entites.dart';

import 'package:photo_search_app/presentation/controller/search_photo_provider.dart';
import 'package:photo_search_app/presentation/router/app_routes_const.dart';
import 'package:photo_search_app/presentation/style/app_string.dart';
import 'package:photo_search_app/presentation/style/app_theme.dart';
import 'package:photo_search_app/presentation/views/widget/home_app_bar_widget.dart';
import 'package:photo_search_app/presentation/views/widget/photo_card.dart';
import 'package:provider/provider.dart';

class PhotoScreenWidget extends StatefulWidget {
  final int? crossAxissAccount;
  final bool? shrankWrap;
  final double? appBarSizedBox;
  final double? searchBarSizedBox;
  final double? childAspectRatio;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final double? mainFontSize;
  final double? secondFontSize;
  final double? iconSize;

  PhotoScreenWidget({
    Key? key,
    required this.crossAxissAccount,
    required this.shrankWrap,
    required this.appBarSizedBox,
    required this.searchBarSizedBox,
    required this.childAspectRatio,
    required this.mainAxisSpacing,
    required this.crossAxisSpacing,
    required this.mainFontSize,
    required this.secondFontSize,
    required this.iconSize,
  }) : super(key: key);
  static const routeNamess = AppRouteConstants.photoViewer;

  @override
  _PhotoScreenWidgetState createState() => _PhotoScreenWidgetState();
}

class _PhotoScreenWidgetState extends State<PhotoScreenWidget> {
  String _query = AppStrings.programing;
  final deviceDirection = DeviceOrientation;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        left: false,
        right: true,
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: size.width * 0.03,
            end: size.width * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBarWidget(
                iconSize: widget.iconSize,
                mainFontSize: widget.mainFontSize,
                secondFontSize: widget.secondFontSize,
              ),
              SizedBox(height: widget.appBarSizedBox),
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: AppStrings.search,
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(size.width * 0.07),
                    borderSide: BorderSide(color: AppColor.searchBarColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(size.width * 0.07),
                    borderSide: BorderSide(color: AppColor.searchBarColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(size.width * 0.07),
                    borderSide: BorderSide(color: AppColor.searchBarColor),
                  ),
                ),
                onSubmitted: (val) => val.trim().isNotEmpty
                    ? setState(() {
                        _query = val.trim();
                      })
                    : _query = AppStrings.programing,
              ),
              SizedBox(height: widget.searchBarSizedBox),
              widget.shrankWrap!
                  ? photoGird()
                  : Expanded(
                      child: photoGird(),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget photoGird() {
    return Consumer<SearchPhotoProvider>(
      builder: (ctx, data, child) {
        return FutureBuilder(
            future: data.getPhotoController(
              query: Photo(query: _query),
            ),
            builder: (ctx, snapShot) {
              return GridView.builder(
                shrinkWrap: widget.shrankWrap!,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: widget.childAspectRatio!,
                  mainAxisSpacing: widget.mainAxisSpacing!,
                  crossAxisSpacing: widget.crossAxisSpacing!,
                  crossAxisCount: widget.crossAxissAccount!,
                ),
                itemBuilder: (ctx, index) {
                  return PhotoCard(
                    photo: data.photo![index],
                    photos: data.photo!,
                    index: index,
                  );
                },
                itemCount: data.photo!.length,
              );
            });
      },
    );
  }
}
