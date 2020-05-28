import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:indiarasoi/Screens/Homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()
  {
    super.initState();
    Future.delayed(Duration(seconds: 5), (){
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => HomePage()));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlareActor("assets/foodssplash.flr",
      alignment:Alignment.center,
      fit: BoxFit.contain,
      animation:"loading"
      ),
    );
  }
}
