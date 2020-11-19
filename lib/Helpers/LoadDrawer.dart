import 'package:flutter/material.dart';
import 'package:indiarasoi/Helpers/RecipeDesign.dart';
import 'package:indiarasoi/Models/recipy.dart';
import 'package:indiarasoi/Routes/route.dart';
import 'package:indiarasoi/Screens/RecipyInfo.dart';

class LoadData extends StatefulWidget {
  final String category;
  final List<Recipy> foods;
  LoadData({this.category, this.foods});

  @override
  _LoadDataState createState() => _LoadDataState();
}

class _LoadDataState extends State<LoadData> {
  int count = 0;
  List<Recipy> items = [];

  _navigateToDetails(Recipy rec) {
    Navigator.of(context).push(
      FadePageRoute(
        builder: (c) {
          return RecipyInfo(
            rec,
          );
        },
        settings: RouteSettings(),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: Colors.white70,
      margin: EdgeInsets.fromLTRB(
        8.0,
        0.0,
        8.0,
        0.0,
      ),
      child: Column(
        children: <Widget>[
          _getListViewWidget(context),
        ],
      ),
    );
  }

  Widget _getListViewWidget(BuildContext context) {
    return Flexible(
      child: GridView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        primary: false,
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        padding: EdgeInsets.all(10.0),
        itemBuilder: _buildItems,
      ),
    );
  }

  Widget _buildItems(BuildContext context, int index) {
    Recipy rec = items[index];
    return GridTile(
      child: GestureDetector(
        onTap: () => _navigateToDetails(rec),
        child: RecDesign(
          title: rec.recipyname,
          imgURL: rec.itemimage,
        ),
      ),
    );
  }

  void totalRec() {
    List<Recipy> rec = widget.foods;
    for (int i = 0; i < rec.length; i++) {
      for (int j = 0; j < rec[i].categories.length; j++) {
        if (rec[i].categories[j] == widget.category) {
          items.add(rec[i]);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    totalRec();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipes',
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.chat,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _buildBody(context),
    );
  }
}