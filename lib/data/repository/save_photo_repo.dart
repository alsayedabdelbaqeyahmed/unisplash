import 'package:photo_search_app/data/resources/local_data_source.dart';
import 'package:photo_search_app/domain/entities/save_photo.dart';
import 'package:photo_search_app/domain/repository/base_save_photo.dart';

class SavePhotoRepo extends BaseSavePhotoRepository {
  SavePhotoRepo._instance();
  static final SavePhotoRepo _getPhotoRepoisotry = SavePhotoRepo._instance();
  factory SavePhotoRepo() => _getPhotoRepoisotry;

  final LocalDataSource _localDataSource = LocalDataSourceHelper();
  @override
  Future<void> baseSavePhotoRep({SavePhoto? save}) async {
    await _localDataSource.loaclDataGetPhoto(
        url: save!.url, ctx: save.context, size: save.size);
  }
}
