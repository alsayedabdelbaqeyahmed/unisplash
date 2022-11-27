import 'package:photo_search_app/domain/entities/save_photo.dart';

abstract class BaseSavePhotoRepository {
  Future<void> baseSavePhotoRep({SavePhoto? save});
}
