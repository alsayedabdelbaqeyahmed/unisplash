import 'dart:convert';

import 'package:photo_search_app/app/utils/api_constants.dart';
import 'package:photo_search_app/app/utils/constants.dart';
import 'package:photo_search_app/app/utils/getIgnored.dart';
import 'package:photo_search_app/data/models/photo_responce.dart';
import 'package:photo_search_app/data/repository/get_photo_repo.dart';
import 'package:photo_search_app/domain/entities/photo_responce_entites.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<PhotoResponce> remoteDataGetPhoto({String? query});
}

class RemoteDataSourceHelper extends RemoteDataSource {
  RemoteDataSourceHelper._instance();
  static final RemoteDataSourceHelper remoteDataSourceHelper =
      RemoteDataSourceHelper._instance();
  factory RemoteDataSourceHelper() => remoteDataSourceHelper;

  @override
  Future<PhotoResponce> remoteDataGetPhoto({String? query}) async {
    PhotoResponceModel? photoResults;
    final url =
        '${AppApiConstants.api}/${AppApiConstants.apiMethos}?client_id=$unSplashapiKey&query=$query';
    try {
      final response = await http.get(Uri.parse(url));
      print(response.statusCode);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        photoResults = PhotoResponceModel.fromJson(data);
      } else {
        print(response.statusCode);
      }
      return photoResults!;
    } catch (e) {
      print(e.toString());
      throw (e.toString());
    }
  }
}
