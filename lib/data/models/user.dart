import 'package:flutter/material.dart';
import 'package:photo_search_app/app/utils/constants.dart';
import 'package:photo_search_app/domain/entities/user_entites.dart';

class UserModel extends User {
  const UserModel({
    @required super.id,
    @required super.name,
    @required super.profileImageUrl,
    @required super.profileUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic>? e) {
    if (e != null) {
      return UserModel(
        id: e[AppConstants.id],
        name: e[AppConstants.name],
        profileImageUrl: e[AppConstants.profile_image][AppConstants.medium],
        profileUrl: e[AppConstants.links][AppConstants.html],
      );
    }
    // ignore: null_check_always_fails
    return null!;
  }
}
