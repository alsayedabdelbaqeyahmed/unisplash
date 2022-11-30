import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:photo_search_app/app/network/failure/failure.dart';
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

  Future<Either<Failure, List<PhotoResponce>>> useCaseGetPhoto(
      {Photo? query, required BuildContext? context}) async {
    final result = await UseCaseGetPhoto()
        .baseGetPhotoRepo!
        .baseGetPhotoRepo(query: query, context: context);
    return result;
  }
}
