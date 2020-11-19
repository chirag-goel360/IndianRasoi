import 'package:flutter/material.dart';
import 'package:indiarasoi/Models/recipy.dart';
import 'package:indiarasoi/Screens/FillDetails.dart';

class RecipyInfo extends StatefulWidget {
  final Recipy rec;
  RecipyInfo(this.rec);

  @override
  _RecipyInfoState createState() => _RecipyInfoState();
}

class _RecipyInfoState extends State<RecipyInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.teal,
              floating: false,
              pinned: true,
              snap: false,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  widget.rec.recipyname,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Image(
                  image: NetworkImage(
                    widget.rec.itemimage,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context,int index){
                if(index>=1) return null;
                return fillDetails(
                  widget.rec,
                );
              },
              ),
            ),
          ],
        ),
      ),
    );
  }
}