import 'package:photo_search_app/domain/entities/photo_entites.dart';
import 'package:photo_search_app/domain/entities/photo_responce_entites.dart';

abstract class BaseGetPhotoRepo {
  Future<List<PhotoResponce>> baseGetPhotoRepo({Photo? query});
}
