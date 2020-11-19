import 'package:flutter/material.dart';

class OnbordingData extends StatefulWidget {
  final String imagePath;
  final String title;
  final String desc;
  OnbordingData({this.imagePath, this.title, this.desc});

  @override
  _OnbordingDataState createState() => _OnbordingDataState(this.imagePath, this.title, this.desc);
}

class _OnbordingDataState extends State<OnbordingData> {
  final String imagePath;
  final String title;
  final String desc;
  _OnbordingDataState(this.imagePath, this.title, this.desc);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.40,
              image: AssetImage(
                imagePath,
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: title + "\n\n",
                style: TextStyle(
                  color: Colors.teal[500],
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: desc,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}