import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_search_app/app/utils/constants.dart';

import 'package:photo_search_app/presentation/style/app_string.dart';

abstract class LocalDataSource {
  Future<void> loaclDataGetPhoto({
    String? url,
    BuildContext? ctx,
    BoxConstraints? size,
  });
  SnackBar snakBars({String? text, BoxConstraints? size});
  Future<void> requestPermission();
}

class LocalDataSourceHelper extends LocalDataSource {
  @override
  SnackBar snakBars({String? text, BoxConstraints? size}) {
    return SnackBar(
      content: Text(
        text!,
        style: TextStyle(fontSize: size!.maxWidth * 0.04),
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
    );
  }

  @override
  Future<void> requestPermission() async {
    await [
      Permission.storage,
    ].request();
  }

  @override
  Future<void> loaclDataGetPhoto(
      {String? url, BuildContext? ctx, BoxConstraints? size}) async {
    await requestPermission();
    var appDocDir = await getTemporaryDirectory();
    String savePath = appDocDir.path + AppStrings.savePath;
    String fileUrl = url!;
    await Dio().download(fileUrl, savePath);
    final result = await ImageGallerySaver.saveFile(savePath);
    print(result[AppConstants.errorMessege]);
    if (result[AppConstants.errorMessege] == null) {
      ScaffoldMessenger.of(ctx!)
          .showSnackBar(snakBars(text: AppStrings.sucess, size: size!));
    } else {
      ScaffoldMessenger.of(ctx!)
          .showSnackBar(snakBars(text: AppStrings.fail, size: size!));
    }
  }
}

/**
 * SnackBar _snakBars(String text, BoxConstraints size) {
    return SnackBar(
      content: Text(
        text,
        style: TextStyle(fontSize: size.maxWidth * 0.04),
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
    );
  }

  Future<void> _requestPermission() async {
    await [
      Permission.storage,
    ].request();
  }

  Future<void> save(
      String url, BuildContext context, BoxConstraints size) async {
    await _requestPermission();
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

 */