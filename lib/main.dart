// ignore_for_file: equal_keys_in_map

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photo_search_app/home.dart';
import 'package:photo_search_app/screens/photo_screen.dart';
import 'package:photo_search_app/screens/photo_viewer_screen.dart';
import 'package:provider/provider.dart';

import 'providers/search_photo_provider.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Photo Search',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData(brightness: Brightness.dark),
        home: Home(),
        routes: {
          PhotoScreen.routeNamess: (ctx) => PhotoScreen(),
        },
      ),
    );
  }
}
