import 'package:flutter/material.dart';
import 'package:moremx/pages/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //routes: getAplicationRoutes(),
      debugShowCheckedModeBanner: false,
      title: 'flutter app',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: SplashScreen(),
    );
  }
}

