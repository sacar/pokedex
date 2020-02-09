import 'package:flutter/material.dart';
import 'package:pokedex/screens/homepage/homepage.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new HomePage(),
      image: new Image.asset('assets/images/logo/logo.png'),
      photoSize: 175.0,
      loaderColor: Colors.transparent,
    );
  }
}
