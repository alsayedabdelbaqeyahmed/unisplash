import 'package:photo_search_app/domain/entities/save_photo.dart';
import 'package:photo_search_app/domain/use_cases/use_case_save_photo.dart';

class SaveImageToGallery {
  // create a singleTone object
  SaveImageToGallery._instance();
  static final SaveImageToGallery _saveImageToGallery =
      SaveImageToGallery._instance();
  factory SaveImageToGallery() => _saveImageToGallery;

  Future<void> save({SavePhoto? savePhoto}) async {
    await UseCaseSavePhoto().useCaseSavePhoto(save: savePhoto);
  }
}
