import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RecDesign extends StatelessWidget {
  final String title;
  final String imgURL;

  const RecDesign({this.title, this.imgURL});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey)
      ),
      // height: 150.0,
      // width: 200.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 130,
            width: 200,
            child:Image(image: NetworkImage(imgURL),
            fit: BoxFit.fill,)
          ),
          Container(
            color:Colors.white,
            child: Text(title,
            style: TextStyle(
              fontSize: 25.0,
            ),
            ),
          ),
        ],
      ),
    );
  }
}
