import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:photo_search_app/app/utils/api_constants.dart';
import 'package:photo_search_app/app/utils/constants.dart';
import 'package:photo_search_app/app/utils/getIgnored.dart';

import 'package:photo_search_app/data/models/photo_responce.dart';
import 'package:photo_search_app/domain/entities/photo_entites.dart';
import 'package:photo_search_app/domain/entities/photo_responce_entites.dart';
import 'package:photo_search_app/domain/use_cases/uase_case_get_photo.dart';

class SearchPhotoProvider with ChangeNotifier {
  List<PhotoResponce>? photo = [];
  Future<void> getPhotoController({Photo? query}) async {
    final result = await UseCaseGetPhoto().useCaseGetPhoto(query: query);
    photo!.add(result);
    notifyListeners();
  }
}
