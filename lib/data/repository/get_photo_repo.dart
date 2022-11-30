import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:photo_search_app/app/network/error_exception.dart';
import 'package:photo_search_app/app/network/failure/failure.dart';
import 'package:photo_search_app/data/resources/remote_data_sources.dart';
import 'package:photo_search_app/domain/entities/photo_entites.dart';
import 'package:photo_search_app/domain/entities/photo_responce_entites.dart';
import 'package:photo_search_app/domain/repository/base_get_photo.dart';

class GetPhotoRepoisotry extends BaseGetPhotoRepo {
  GetPhotoRepoisotry._instance();
  static final GetPhotoRepoisotry _getPhotoRepoisotry =
      GetPhotoRepoisotry._instance();
  factory GetPhotoRepoisotry() => _getPhotoRepoisotry;

  final RemoteDataSource _remoteDataSource = RemoteDataSourceGetPhoto();
  @override
  Future<Either<Failure, List<PhotoResponce>>> baseGetPhotoRepo(
      {Photo? query, required BuildContext? context}) async {
    try {
      final result = await _remoteDataSource.remoteDataGetPhoto(
          query: query!.query, context: context);
      return right(result);
    } on ServerException catch (e) {
      String? errorMessege;
      for (var i = 0; i < e.errorModel!.errors!.length; i++) {
        errorMessege = e.errorModel!.errors![i];
      }
      return left(
        ServerFailuren(messege: errorMessege),
      );
    }
  }
}
