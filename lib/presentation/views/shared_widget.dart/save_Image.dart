import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_search_app/app/utils/constants.dart';
import 'package:photo_search_app/presentation/style/app_string.dart';

class SaveImageToGallery {
  SnackBar _snakBars(String text, BoxConstraints size) {
    return SnackBar(
      content: Text(
        text,
        style: TextStyle(fontSize: size.maxWidth * 0.04),
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

  save(String url, BuildContext context, BoxConstraints size) async {
    _requestPermission();
    var appDocDir = await getTemporaryDirectory();
    String savePath = appDocDir.path + AppStrings.savePath;
    String fileUrl = url;
    await Dio().download(fileUrl, savePath);
    final result = await ImageGallerySaver.saveFile(savePath);
    print(result[AppConstants.errorMessege]);
    if (result[AppConstants.errorMessege] == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(_snakBars(AppStrings.sucess, size));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(_snakBars(AppStrings.fail, size));
    }
  }
}
