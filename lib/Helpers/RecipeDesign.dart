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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child:Image(image: NetworkImage('https://www.oyorooms.com/blog/wp-content/uploads/2019/06/Top-10-Hunger-Points-for-Foodies-in-Delhi-Hero-Image.jpg'),)
          ),
          Container(
            color:Colors.white,
            child: Text(title,
            style: TextStyle(
              fontSize: 30.0,
              
            ),
            ),
          ),
        ],
      ),
    );
  }
}
