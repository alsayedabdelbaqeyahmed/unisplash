import 'dart:convert';

import 'package:photo_search_app/app/utils/api_constants.dart';
import 'package:photo_search_app/app/utils/constants.dart';
import 'package:photo_search_app/app/utils/getIgnored.dart';
import 'package:photo_search_app/data/models/photo_responce.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<PhotoResponceModel>> remoteDataGetPhoto({String? query});
}

class RemoteDataSourceHelper extends RemoteDataSource {
  RemoteDataSourceHelper._instance();
  static final RemoteDataSourceHelper remoteDataSourceHelper =
      RemoteDataSourceHelper._instance();
  factory RemoteDataSourceHelper() => remoteDataSourceHelper;

  @override
  Future<List<PhotoResponceModel>> remoteDataGetPhoto({String? query}) async {
    List<PhotoResponceModel>? photoResults;
    final url =
        '${AppApiConstants.api}/${AppApiConstants.apiMethos}?client_id=$unSplashapiKey&query=$query&page=10&per_page=100';
    try {
      final response = await http.get(Uri.parse(url));
      print(response.statusCode);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        print(data[AppConstants.results]);
        List<dynamic> result = data[AppConstants.results];
        List<PhotoResponceModel> data2 =
            result.map((e) => PhotoResponceModel.fromJson(e)).toList();
        photoResults = data2;
      } else {
        print(response.statusCode);
      }
      return photoResults!;
    } catch (e) {
      print('error is ${e.toString()}');
      throw (e.toString());
    }
  }
}
