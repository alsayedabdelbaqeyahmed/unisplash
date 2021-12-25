import 'package:flutter/foundation.dart';

import 'user.dart';

class Photo {
  final String id;
  final String url;
  final String description;
  final User user;

  const Photo({
    @required this.id,
    @required this.url,
    @required this.description,
    @required this.user,
  });

  factory Photo.fromJson(Map<String, dynamic> e) {
    if (e != null) {
      return Photo(
        id: e['id'],
        url: e['urls']['regular'],
        description: e['description'],
        user: User.fromJson(
          e['user'],
        ),
      );
    }
    return null;
  }
}
