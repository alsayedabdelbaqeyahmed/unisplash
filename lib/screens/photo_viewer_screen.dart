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
  PageController? _pageController;
  @override
  void didChangeDependencies() {
    final PhotoCard dataRecived2 =
        ModalRoute.of(context)!.settings.arguments as PhotoCard;
    _pageController = PageController(initialPage: dataRecived2.index);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _pageController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final islandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final PhotoCard dataRecived =
        ModalRoute.of(context)!.settings.arguments as PhotoCard;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: LayoutBuilder(builder: (context, constrain) {
        return PageView.builder(
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
                          height: constrain.maxHeight * 0.8,
                          child: Hero(
                            tag: Key('${dataRecived.photo.id}_$index2'),
                            child: CachedNetworkImage(
                              imageUrl: dataRecived.photos[index2].url!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: constrain.maxWidth * 0.06,
                          bottom: constrain.maxHeight * 0.01,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: islandScape
                                ? constrain.maxWidth * 0.03
                                : constrain.maxHeight * 0.03,
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  SaveImageToGallery().save(
                                    dataRecived.photos[index2].url!,
                                    context,
                                    constrain,
                                  );
                                },
                                icon: Icon(
                                  Icons.download,
                                  color: Colors.black,
                                  size: islandScape
                                      ? constrain.maxWidth * 0.03
                                      : constrain.maxHeight * 0.03,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: constrain.maxHeight * .03),
                    Padding(
                      padding: EdgeInsets.all(constrain.maxWidth * 0.036),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(${index2 + 1} / ${dataRecived.photos.length})',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: islandScape
                                  ? constrain.maxWidth * 0.03
                                  : constrain.maxHeight * 0.03,
                            ),
                          ),
                          SizedBox(height: constrain.maxHeight * .015),
                          Text(
                            dataRecived.photos[index2].description != null
                                ? '${dataRecived.photos[index2].description}'
                                : 'Sorry there is no description',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: islandScape
                                  ? constrain.maxWidth * 0.02
                                  : constrain.maxHeight * 0.02,
                            ),
                          ),
                          SizedBox(height: constrain.maxHeight * .015),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: islandScape
                                    ? constrain.maxWidth * 0.04
                                    : constrain.maxHeight * 0.03,
                                backgroundColor: Colors.grey[100],
                                backgroundImage: CachedNetworkImageProvider(
                                  dataRecived
                                      .photos[index2].user.profileImageUrl!,
                                ),
                              ),
                              SizedBox(width: constrain.maxWidth * 0.02),
                              GestureDetector(
                                child: Text(
                                  '${dataRecived.photos[index2].user.name}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: islandScape
                                        ? constrain.maxWidth * 0.03
                                        : constrain.maxHeight * 0.03,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                onTap: () async {
                                  final url = dataRecived
                                      .photos[index2].user.profileUrl!;
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
            });
      }),
    );
  }
}
