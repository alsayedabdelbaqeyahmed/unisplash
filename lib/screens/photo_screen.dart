import 'package:flutter/material.dart';
import 'package:photo_search_app/providers/search_photo_provider.dart';
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
    // final providerData = Provider.of<SearchPhotoProvider>(context, listen: false);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Photos'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                fillColor: Colors.white,
                filled: true,
              ),
              onSubmitted: (val) => val.trim().isNotEmpty
                  ? setState(() => _query = val.trim())
                  : _query = 'programming',
            ),
            const SizedBox(height: 15),
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
    );
  }
}
