import 'package:flutter/material.dart';
import 'package:photo_search_app/providers/dark_theme.dart';
import 'package:photo_search_app/providers/myTheme.dart';
import 'package:photo_search_app/providers/search_photo_provider.dart';
import 'package:photo_search_app/widget/home_app_bar_widget.dart';
import 'package:photo_search_app/widget/photo_card.dart';
import 'package:provider/provider.dart';

class PhotoScreen extends StatefulWidget {
  PhotoScreen({Key key}) : super(key: key);
  static const routeNamess = 'photoViewer';

  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  String _query = 'programming';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: size.width * 0.03,
              end: size.width * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppBarWidget(),
                SizedBox(height: size.height * .02),
                TextField(
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
                      ? setState(() => _query = val.trim())
                      : _query = 'programming',
                ),
                SizedBox(height: size.height * .02),
                Expanded(
                  child: Consumer<SearchPhotoProvider>(
                    builder: (ctx, data, child) {
                      return FutureBuilder(
                        future: data.searchPhoto(query: _query),
                        builder: (ctx, snapShot) => GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.8,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (ctx, index) {
                            return PhotoCard(
                              photo: data.photos[index],
                              photos: data.photos,
                              index: index,
                            );
                          },
                          itemCount: data.photos.length,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
