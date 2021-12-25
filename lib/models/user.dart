import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String profileImageUrl;
  final String profileUrl;

  const User({
    @required this.id,
    @required this.name,
    @required this.profileImageUrl,
    @required this.profileUrl,
  });

  factory User.fromJson(Map<String, dynamic> e) {
    if (e != null) {
      return User(
        id: e['id'],
        name: e['name'],
        profileImageUrl: e['profile_image']['medium'],
        profileUrl: e['links']['html'],
      );
    }
    return null;
  }
}
