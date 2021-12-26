import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class SaveImageToGallery {
  SnackBar _snakBars(String text, Size size) {
    return SnackBar(
      content: Text(
        text,
        style: TextStyle(fontSize: size.width * 0.04),
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
    );
  }

  _requestPermission() async {
    await [
      Permission.storage,
    ].request();
  }

  save(String url, BuildContext context, Size size) async {
    _requestPermission();
    var appDocDir = await getTemporaryDirectory();
    String savePath = appDocDir.path + "/temp.gif";
    String fileUrl = url;
    await Dio().download(fileUrl, savePath);
    final result = await ImageGallerySaver.saveFile(savePath);
    print(result['errorMessege']);
    if (result['errorMessege'] == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(_snakBars('Download complete successfully', size));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(_snakBars('An error occured', size));
    }
  }
}
