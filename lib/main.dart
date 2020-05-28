import 'package:flutter/material.dart';
import 'package:indiarasoi/Helpers/splashscreen.dart';
import 'package:indiarasoi/Screens/Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: SplashScreen(),),
    );
  }
}
