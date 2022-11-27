import 'package:photo_search_app/app/utils/constants.dart';
import 'package:photo_search_app/data/models/user.dart';
import 'package:photo_search_app/domain/entities/photo_responce_entites.dart';

class PhotoResponceModel extends PhotoResponce {
  const PhotoResponceModel({
    super.description,
    super.id,
    super.url,
    super.user,
  });

  factory PhotoResponceModel.fromJson(Map<String, dynamic> e) {
    // ignore: unnecessary_null_comparison
    if (e != null) {
      return PhotoResponceModel(
        id: e[AppConstants.id],
        url: e[AppConstants.urls][AppConstants.regular],
        description: e[AppConstants.description],
        user: UserModel.fromJson(
          e[AppConstants.user],
        ),
      );
    }
    // ignore: null_check_always_fails
    return null!;
  }
}
