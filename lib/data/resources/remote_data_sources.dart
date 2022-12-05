import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:photo_search_app/app/network/error_exception.dart';
import 'package:photo_search_app/app/network/error_models.dart';

import 'package:photo_search_app/app/utils/api_constants.dart';
import 'package:photo_search_app/app/utils/constants.dart';
import 'package:photo_search_app/app/utils/api_key.dart';
import 'package:photo_search_app/data/models/photo_responce.dart';

abstract class RemoteDataSource {
  Future<List<PhotoResponceModel>> remoteDataGetPhoto(
      {String? query, required BuildContext? context});
}

class RemoteDataSourceGetPhoto extends RemoteDataSource {
  RemoteDataSourceGetPhoto._instance();
  static final RemoteDataSourceGetPhoto remoteDataSourceHelper =
      RemoteDataSourceGetPhoto._instance();
  factory RemoteDataSourceGetPhoto() => remoteDataSourceHelper;

  @override
  Future<List<PhotoResponceModel>> remoteDataGetPhoto(
      {String? query, required BuildContext? context}) async {
    List<PhotoResponceModel>? photoResults;
    final url =
        '${AppApiConstants.api}/${AppApiConstants.apiMethos}?client_id=$unSplashapiKey&query=$query&page=10&per_page=100';
    try {
      final response = await Dio().get(url);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        print(data[AppConstants.results]);
        List<dynamic> result = data[AppConstants.results];
        List<PhotoResponceModel> data2 =
            result.map((e) => PhotoResponceModel.fromJson(e)).toList();
        photoResults = data2;
      } else {
        print(response.data[AppConstants.errors]);
        ServerException(
          errorModel: ErrorModel.fromJson(
            response.data[AppConstants.errors],
          ),
        );
      }
      return photoResults!;
    } catch (e) {
      {
        print(e.toString());
        throw showDialog(
            context: context!,
            builder: ((context) => AlertDialog(
                  alignment: Alignment.center,
                  title: Text(
                    'error',
                  ),
                  content: Text(
                    'please check your connection \n if it is work please wait till we fix the error',
                    textDirection: TextDirection.rtl,
                  ),
                  actions: [
                    TextButton(
                      onPressed: (() => Navigator.pop(context)),
                      child: Text(
                        'try again',
                        textDirection: TextDirection.rtl,
                      ),
                    )
                  ],
                )));
      }
    }
  }
}
