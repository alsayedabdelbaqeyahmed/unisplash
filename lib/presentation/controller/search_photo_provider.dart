import 'package:flutter/material.dart';

import 'package:photo_search_app/domain/entities/photo_entites.dart';
import 'package:photo_search_app/domain/entities/photo_responce_entites.dart';
import 'package:photo_search_app/domain/use_cases/uase_case_get_photo.dart';

class SearchPhotoProvider with ChangeNotifier {
  Future<List<PhotoResponce>>? getPhotoController(
      {Photo? query, BuildContext? context}) async {
    List<PhotoResponce>? _photo = [];
    final result =
        await UseCaseGetPhoto().useCaseGetPhoto(query: query, context: context);
    result.fold(
        (l) => showDialog(
              context: context!,
              builder: ((context) => AlertDialog(
                    alignment: Alignment.center,
                    title: Text(
                      'error',
                      textDirection: TextDirection.rtl,
                    ),
                    content: Text(
                      l.messege!,
                      textDirection: TextDirection.rtl,
                    ),
                    actions: [
                      TextButton(
                        onPressed: (() => Navigator.pop(context)),
                        child: Text(
                          'try again',
                          textDirection: TextDirection.rtl,
                        ),
                      )
                    ],
                  )),
            ), (r) {
      r.isEmpty
          ? showDialog(
              context: context!,
              builder: ((context) => AlertDialog(
                    alignment: Alignment.center,
                    title: Text(
                      'احنا هنهزر',
                      textDirection: TextDirection.rtl,
                    ),
                    content: Text(
                      'اكتب الاسم عدل متقرفناش معاك ',
                      textDirection: TextDirection.rtl,
                    ),
                    actions: [
                      TextButton(
                        onPressed: (() => Navigator.pop(context)),
                        child: Text(
                          'امشي يلا',
                          textDirection: TextDirection.rtl,
                        ),
                      )
                    ],
                  )),
            )
          : _photo = r;
    });

    notifyListeners();
    return _photo!;
  }
}
