import 'package:photo_search_app/data/resources/remote_data_sources.dart';
import 'package:photo_search_app/domain/entities/photo_entites.dart';
import 'package:photo_search_app/domain/entities/photo_responce_entites.dart';
import 'package:photo_search_app/domain/repository/base_get_photo.dart';

class GetPhotoRepoisotry extends BaseGetPhotoRepo {
  GetPhotoRepoisotry._instance();
  static final GetPhotoRepoisotry _getPhotoRepoisotry =
      GetPhotoRepoisotry._instance();
  factory GetPhotoRepoisotry() => _getPhotoRepoisotry;

  final RemoteDataSource _remoteDataSource = RemoteDataSourceHelper();
  @override
  Future<List<PhotoResponce>> baseGetPhotoRepo({Photo? query}) async {
    final result =
        await _remoteDataSource.remoteDataGetPhoto(query: query!.query);
    return result;
  }
}
