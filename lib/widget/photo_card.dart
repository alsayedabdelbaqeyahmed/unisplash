import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_search_app/models/photo.dart';
import 'package:photo_search_app/screens/photo_viewer_screen.dart';

class PhotoCard extends StatelessWidget {
  final Photo photo;
  final int index;
  final List<Photo> photos;

  const PhotoCard({
    Key key,
    @required this.photo,
    @required this.photos,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        PhotoViewerScreen.routeNames,
        arguments: PhotoCard(
          index: this.index,
          photo: this.photo,
          photos: this.photos,
        ),
      ),
      child: Hero(
        tag: Key('${photo.id}_$index'),
        child: Container(
          margin: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 4.0,
              ),
            ],
            image: DecorationImage(
              image: CachedNetworkImageProvider(photo.url),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
