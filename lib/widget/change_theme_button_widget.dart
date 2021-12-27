import 'package:flutter/material.dart';
import 'package:photo_search_app/providers/dark_theme.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ChangeTheme>(context, listen: false);

    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        themeProvider.toggleTheme(value);
      },
      activeColor: Colors.white,
      inactiveThumbColor: Colors.black,
    );
  }
}
