import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gradients/flutter_gradients.dart';

class RecDesign extends StatelessWidget {
  final String title;
  final String imgURL;

  const RecDesign({this.title, this.imgURL});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: FlutterGradient.everlastingSky(),
        color: Colors.white,
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
          topLeft: Radius.circular(5.0),
          topRight: Radius.circular(5.0),
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
              height: 130,
              width: 200,
              child:Image(image: NetworkImage(imgURL),
                fit: BoxFit.cover,alignment: Alignment.center,)
          ),
          Container(
            child: FittedBox(
              child: Text(title,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
