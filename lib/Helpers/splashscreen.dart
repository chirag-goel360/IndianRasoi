import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indiarasoi/Helpers/loadBoard.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          MaterialPageRoute(builder: (context) => TestScreen()));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/loadingscreen.png"),
                    fit: BoxFit.fill,
                  )
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100,
                  child: Text('Indian Rasoi',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.pink
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  width: 400,
                  child: FlareActor("assets/foodssplash.flr",
                      alignment:Alignment.center,
                      fit: BoxFit.contain,
                      animation:"loading"
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
}
