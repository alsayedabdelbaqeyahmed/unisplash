import 'package:photo_search_app/data/repository/save_photo_repo.dart';
import 'package:photo_search_app/domain/entities/save_photo.dart';
import 'package:photo_search_app/domain/repository/base_save_photo.dart';

class UseCaseSavePhoto {
  UseCaseSavePhoto._instance();
  static final UseCaseSavePhoto _postPhoneAndUser =
      UseCaseSavePhoto._instance();
  factory UseCaseSavePhoto() => _postPhoneAndUser;

  final BaseSavePhotoRepository? baseGetPhotoRepo = SavePhotoRepo();
  Future<void> useCaseSavePhoto({SavePhoto? save}) async {
    await UseCaseSavePhoto().baseGetPhotoRepo!.baseSavePhotoRep(save: save);
  }
}
