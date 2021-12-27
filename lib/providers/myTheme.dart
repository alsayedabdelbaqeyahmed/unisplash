import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:photo_search_app/providers/dark_theme.dart';
import 'package:provider/provider.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.red, opacity: 0.8),
  );

  static Color fontColor(BuildContext context) {
    if (Provider.of<ChangeTheme>(context, listen: false).themeMode ==
        ThemeMode.dark) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
