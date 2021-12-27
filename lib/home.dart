import 'package:flutter/material.dart';
import 'package:photo_search_app/screens/photo_screen.dart';

import 'constants/animated_page-route.dart';

class Home extends StatelessWidget {
  static const routeNames = '/Home';
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image(
              image: AssetImage('assets/images/unsplash.png'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: size.height * 0.65,
            left: size.width * 0.08,
            child: Text(
              'Creation Start Here.',
              style: TextStyle(
                fontSize: size.height * 0.04,
                color: const Color(0xffE0F2F1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.82,
            right: size.width * 0.03,
            child: TextButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                AnimatedPageRoute(
                  beginDx: 10.0,
                  beginDy: 10.0,
                  endDx: 0.0,
                  endDy: 0.0,
                  curve: Curves.ease,
                  widget: PhotoScreen(),
                  duration: Duration(seconds: 1),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    'Start',
                    style: TextStyle(
                      fontSize: size.height * 0.03,
                      color: const Color(0xffFFFFFF),
                    ),
                  ),
                  SizedBox(width: size.width * 0.03),
                  Icon(
                    Icons.camera,
                    size: size.width * 0.09,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
