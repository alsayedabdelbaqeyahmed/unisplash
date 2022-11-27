import 'package:flutter/material.dart';

import 'package:photo_search_app/domain/entities/photo_entites.dart';
import 'package:photo_search_app/domain/entities/photo_responce_entites.dart';
import 'package:photo_search_app/domain/use_cases/uase_case_get_photo.dart';

class SearchPhotoProvider with ChangeNotifier {
  List<PhotoResponce>? photo = [];
  Future<void> getPhotoController({Photo? query}) async {
    final result = await UseCaseGetPhoto().useCaseGetPhoto(query: query);
    photo = result;
    notifyListeners();
  }
}
