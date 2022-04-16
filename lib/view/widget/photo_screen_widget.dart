// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:photo_search_app/controller/providers/search_photo_provider.dart';
import 'package:photo_search_app/view/widget/home_app_bar_widget.dart';
import 'package:photo_search_app/view/widget/photo_card.dart';
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
  static const routeNamess = 'photoViewer';

  @override
  _PhotoScreenWidgetState createState() => _PhotoScreenWidgetState();
}

class _PhotoScreenWidgetState extends State<PhotoScreenWidget> {
  String _query = 'programming';
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
                  hintText: 'Search',
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(size.width * 0.07),
                    borderSide: BorderSide(color: Color(0xff7E8EAA)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(size.width * 0.07),
                    borderSide: BorderSide(color: Color(0xff7E8EAA)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(size.width * 0.07),
                    borderSide: BorderSide(color: Color(0xff7E8EAA)),
                  ),
                ),
                onSubmitted: (val) => val.trim().isNotEmpty
                    ? setState(() {
                        print('dadadada');
                        _query = val.trim();
                      })
                    : _query = 'programming',
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
            future: data.searchPhoto(query: _query),
            builder: (ctx, snapShot) {
              print('saasa');
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
                    photo: data.photos[index],
                    photos: data.photos,
                    index: index,
                  );
                },
                itemCount: data.photos.length,
              );
            });
      },
    );
  }
}
