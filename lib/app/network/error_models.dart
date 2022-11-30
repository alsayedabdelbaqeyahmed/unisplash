import 'package:photo_search_app/app/utils/constants.dart';

class ErrorModel {
  final String? errors;

  ErrorModel({this.errors});

  factory ErrorModel.fromJson(Map<String, dynamic> map) {
    return ErrorModel(errors: map[AppConstants.errors]);
  }
}
