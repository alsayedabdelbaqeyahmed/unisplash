import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_search_app/constants/save_Image.dart';
import 'package:photo_search_app/widget/photo_card.dart';
import 'package:url_launcher/url_launcher.dart';

class PhotoViewerScreen extends StatefulWidget {
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
    final size = MediaQuery.of(context).size;
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
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: size.height * 0.8,
                        child: Hero(
                          tag: Key('${dataRecived.photo.id}_$index2'),
                          child: CachedNetworkImage(
                            imageUrl: dataRecived.photos[index2].url,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: size.width * 0.06,
                        bottom: size.height * 0.01,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: size.width * 0.06,
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                SaveImageToGallery().save(
                                  dataRecived.photos[index2].url,
                                  context,
                                  size,
                                );
                              },
                              icon: Icon(
                                Icons.download,
                                color: Colors.black,
                                size: size.height * 0.04,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .03),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.025),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '(${index2 + 1} / ${dataRecived.photos.length})',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.02,
                          ),
                        ),
                        SizedBox(height: size.height * .015),
                        Text(
                          dataRecived.photos[index2].description != null
                              ? '${dataRecived.photos[index2].description}'
                              : 'Sorry there is no description',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: size.height * 0.019),
                        ),
                        SizedBox(height: size.height * .015),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: size.width * 0.05,
                              backgroundColor: Colors.grey[100],
                              backgroundImage: CachedNetworkImageProvider(
                                dataRecived.photos[index2].user.profileImageUrl,
                              ),
                            ),
                            SizedBox(width: size.width * 0.02),
                            GestureDetector(
                              child: Text(
                                '${dataRecived.photos[index2].user.name}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.04,
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
              ),
            );
          }),
    );
  }
}
