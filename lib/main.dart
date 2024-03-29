// ignore_for_file: equal_keys_in_map
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photo_search_app/presentation/controller/dark_theme.dart';
import 'package:photo_search_app/presentation/style/app_theme.dart';
import 'package:photo_search_app/presentation/views/screens/home.dart';
import 'package:photo_search_app/presentation/views/screens/photo_screen.dart';
import 'package:provider/provider.dart';
import 'presentation/controller/search_photo_provider.dart';

void main() {
  EquatableConfig.stringify = kDebugMode;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => SearchPhotoProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ChangeTheme(),
          builder: (context, _) {
            final themeprovider = Provider.of<ChangeTheme>(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Photo Search',
              themeMode: themeprovider.themeMode,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              home: Home(),
              routes: {
                PhotoScreen.routeNamess: (ctx) => PhotoScreen(),
              },
            );
          },
        ),
      ],
    );
  }
}
