import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:photo_search_app/constants/api.dart';
import 'package:photo_search_app/models/photo.dart';

class SearchPhotoProvider with ChangeNotifier {
  static const int numberPerPage = 100;
  List<Photo> _photos = [];
  List<Photo> get photos {
    return [..._photos];
  }

  Future<List<Photo>> searchPhoto(
      {String? query, int page = 5, String? name}) async {
    final url =
        'https://api.unsplash.com/search/photos?client_id=$unSplashapi&page=$page&per_page=$numberPerPage&query=$query';
    try {
      final response = await http.get(Uri.parse(url));
      print(response.statusCode);
      // print(name);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        // print(data['results']);
        final List results = data['results'];
        final List<Photo> photos =
            results.map((ele) => Photo.fromJson(ele)).toList();

        _photos = photos;
        return _photos;
      } else {
        print(response.statusCode);
      }
      return [];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
