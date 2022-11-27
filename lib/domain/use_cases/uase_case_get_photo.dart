import 'package:photo_search_app/data/repository/get_photo_repo.dart';
import 'package:photo_search_app/domain/entities/photo_entites.dart';
import 'package:photo_search_app/domain/entities/photo_responce_entites.dart';
import 'package:photo_search_app/domain/repository/base_get_photo.dart';

class UseCaseGetPhoto {
  /// creaye a single tone object
  UseCaseGetPhoto._instance();
  static final UseCaseGetPhoto _postPhoneAndUser = UseCaseGetPhoto._instance();
  factory UseCaseGetPhoto() => _postPhoneAndUser;

  final BaseGetPhotoRepo? baseGetPhotoRepo = GetPhotoRepoisotry();

  Future<PhotoResponce> useCaseGetPhoto({Photo? query}) async {
    final result =
        UseCaseGetPhoto().baseGetPhotoRepo!.baseGetPhotoRepo(query: query);
    return result;
  }
}
