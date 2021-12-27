import 'package:flutter/material.dart';
import 'package:photo_search_app/providers/dark_theme.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ChangeTheme>(context);

    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ChangeTheme>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}
