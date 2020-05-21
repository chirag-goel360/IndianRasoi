import 'package:flutter/material.dart';
import 'package:indiarasoi/Models/recipy.dart';
import 'package:indiarasoi/Screens/FillDetails.dart';
import 'package:indiarasoi/Services/FoodApi.dart';

class RecipyInfo extends StatefulWidget {
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
                //Variable Name to be written
                title: Text('CupCake',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                ),
                background: Image(
                  //Variable Image to be written
                  image: NetworkImage('https://image.shutterstock.com/image-photo/bright-spring-view-cameo-island-260nw-1048185397.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context,int index){
                if(index>=1) return null;
                return fillDetails();
              }
              ),
            )
          ],
        ),
      ),
    );
  }
}