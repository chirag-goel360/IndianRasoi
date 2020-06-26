import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:indiarasoi/Helpers/LoadDrawer.dart';
import 'package:indiarasoi/Helpers/RecipeDesign.dart';
import 'package:indiarasoi/Models/recipy.dart';
import 'package:indiarasoi/Routes/route.dart';
import 'package:indiarasoi/Screens/Developers.dart';
import 'package:indiarasoi/Screens/RecipyInfo.dart';
import 'package:indiarasoi/Services/FoodApi.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipy> foods = [];
  FoodApi ap = FoodApi();
  _loadFood() async {
    foods = await ap.getAllRecipy();
    setState(() {
      foods = foods;
    });
    print(foods.length);
    print(foods.toString());
  }

  Future<bool> _onBackPressed(){
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          title: new Text('Are you Sure?'),
          content: new Text('Do you want to exit Application'),
          actions: <Widget>[
            Padding(padding: EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO",
                  style: TextStyle(
                      color: Colors.blueAccent
                  ),),
              ),),
            SizedBox(height: 25,),
            Padding(padding: EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () => SystemNavigator.pop(),
                child: Text("YES",
                  style: TextStyle(
                      color: Colors.blueAccent
                  ),),
              ),)
          ],
        )
    ) ?? false;
  }

  Future<Null> refresh() {
    _loadFood();
    return new Future<Null>.value();
  }

  void initState() {
    super.initState();
    _loadFood();
  }

  _navigateToDetails(Recipy rec) {
    Navigator.of(context).push(
      new FadePageRoute(
        builder: (c) {
          return new RecipyInfo(rec);
        },
        settings: new RouteSettings(),
      ),
    );
  }

  Widget _getDrawer(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.teal,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  'https://articles-images.sftcdn.net/wp-content/uploads/sites/3/2017/08/foodie-apps1.jpg'),
            ),
          ),
          child: Center(
            child: Container(
              child: Text(
                'IndianRasoi',
                style: TextStyle(fontSize: 45.0, color: Colors.black),
              ),
            ),
          ),
        ),
        ListTile(
          title: Text('Desserts'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoadData(
                      category: 'Dessert',
                      foods: foods,
                    )));
          },
        ),
        ListTile(
          title: Text('Snacks'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoadData(
                      category: 'Snacks',
                      foods: foods,
                    )));
          },
        ),
        ListTile(
          title: Text('Main Course'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoadData(
                      category: 'Main Course',
                      foods: foods,
                    )));
          },
        ),
        ListTile(
          title: Text('Breakfast'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoadData(
                      category: 'Breakfast',
                      foods: foods,
                    )));
          },
        ),
        ListTile(
          title: Text('Lunch'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoadData(
                      category: 'Lunch',
                      foods: foods,
                    )));
          },
        ),
        ListTile(
          title: Text('Dinner'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoadData(
                      category: 'Dinner',
                      foods: foods,
                    )));
          },
        ),
        ListTile(
          title: Text('EasyCook'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoadData(
                      category: 'EasyCook',
                      foods: foods,
                    )));
          },
        ),
        Divider(
          color: Colors.black,
        ),
        ListTile(
          title: Text('About Developers'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Developers()));
          },
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return new Container(
      color: Colors.white70,
      margin: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      child: new Column(
        children: <Widget>[
          _getListViewWidget(context),
        ],
      ),
    );
  }

  Widget _getListViewWidget(BuildContext context) {
    return Flexible(
      child: RefreshIndicator(
        onRefresh: refresh,
        color: Colors.green,
        child: GridView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          primary: false,
          itemCount: foods.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
          padding: const EdgeInsets.all(10.0),
          itemBuilder: _buildItems,
        ),
      ),
    );
  }

  Widget _buildItems(BuildContext context, int index) {
    Recipy rec = foods[index];
    return GridTile(
      child: GestureDetector(
          onTap: () => _navigateToDetails(rec),
          child: RecDesign(
            title: rec.recipyname,
            imgURL: rec.itemimage,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Recipes'),
          centerTitle: true,
          backgroundColor: Colors.teal,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
                onPressed: null)
          ],
        ),
        drawer: Drawer(
          child: _getDrawer(context),
        ),
        body: _buildBody(context),
      ),
    );
  }
}
