import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:photo_search_app/app/network/failure/failure.dart';
import 'package:photo_search_app/domain/entities/photo_entites.dart';
import 'package:photo_search_app/domain/entities/photo_responce_entites.dart';

abstract class BaseGetPhotoRepo {
  Future<Either<Failure, List<PhotoResponce>>> baseGetPhotoRepo(
      {Photo? query, required BuildContext? context});
}
