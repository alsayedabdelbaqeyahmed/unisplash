import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_search_app/widget/photo_card.dart';
import 'package:url_launcher/url_launcher.dart';

class PhotoViewerScreen extends StatefulWidget {
  static const routeNames = 'photoViewer';

  @override
  _PhotoViewerScreenState createState() => _PhotoViewerScreenState();
}

class _PhotoViewerScreenState extends State<PhotoViewerScreen> {
  PageController _pageController;
  @override
  void didChangeDependencies() {
    final PhotoCard dataRecived2 = ModalRoute.of(context).settings.arguments;
    _pageController = PageController(initialPage: dataRecived2.index);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PhotoCard dataRecived = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: PageView.builder(
          controller: _pageController,
          itemCount: dataRecived.photos.length,
          itemBuilder: (ctx, index2) {
            print(index2);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  child: Hero(
                    tag: Key('${dataRecived.photo.id}_$index2'),
                    child: CachedNetworkImage(
                      imageUrl: dataRecived.photos[index2].url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '(${index2 + 1} / ${dataRecived.photos.length})',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        dataRecived.photos[index2].description != null
                            ? '${dataRecived.photos[index2].description}'
                            : 'Sorry there is no description',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16.0,
                            backgroundColor: Colors.grey[100],
                            backgroundImage: CachedNetworkImageProvider(
                              dataRecived.photos[index2].user.profileImageUrl,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            child: Text(
                              '${dataRecived.photos[index2].user.name}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onTap: () async {
                              final url =
                                  dataRecived.photos[index2].user.profileUrl;
                              if (await canLaunch(url)) {
                                await launch(url);
                              }
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
