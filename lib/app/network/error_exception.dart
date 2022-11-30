import 'package:photo_search_app/app/network/error_models.dart';

class ServerException implements Exception {
  final ErrorModel? errorModel;
  const ServerException({this.errorModel});
}
