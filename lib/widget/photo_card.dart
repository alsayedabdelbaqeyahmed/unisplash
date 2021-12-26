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
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        PageRouteBuilder(
          settings: RouteSettings(
            arguments: PhotoCard(
              photo: this.photo,
              index: this.index,
              photos: this.photos,
            ),
          ),
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final begin = Offset(10.0, 10.0);
            final end = Offset(0, 0);

            var tween = Tween(begin: begin, end: end)
                .chain(CurveTween(curve: Curves.ease));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) =>
              PhotoViewerScreen(),
        ),
      ),
      child: Hero(
        tag: Key('${photo.id}_$index'),
        child: Container(
          margin: EdgeInsetsDirectional.only(
            start: size.width * 0.01,
            end: size.width * 0.01,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(size.width * 0.03),
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
