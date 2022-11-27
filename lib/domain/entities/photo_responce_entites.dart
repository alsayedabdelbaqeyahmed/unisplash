import 'package:photo_search_app/data/models/user.dart';
import 'package:photo_search_app/domain/entities/user_entites.dart';

class PhotoResponce {
  final String? id;
  final String? url;
  final String? description;
  final User? user;

  const PhotoResponce({
    required this.id,
    required this.url,
    required this.description,
    required this.user,
  });
}
