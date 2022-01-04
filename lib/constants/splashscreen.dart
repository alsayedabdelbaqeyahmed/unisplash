import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor:
          lightMode ? const Color(0xffe1f5fe) : const Color(0xff042a49),
      body: Center(
          child: lightMode
              ? Image.asset('assets/splash/unsplash_light.png')
              : Image.asset('assets/splash/unsplash_dark.png')),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 2));
  }
}
