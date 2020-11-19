import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:indiarasoi/Helpers/LoadDrawer.dart';
import 'package:indiarasoi/Helpers/RecipeDesign.dart';
import 'package:indiarasoi/Models/recipy.dart';
import 'package:indiarasoi/Routes/route.dart';
import 'package:indiarasoi/Screens/Developers.dart';
import 'package:indiarasoi/Screens/RecipyInfo.dart';
import 'package:indiarasoi/Screens/stories.dart';
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
      foods = filteredList = foods;
    });
    print(foods.length);
    print(filteredList.length);
    print(foods.toString());
  }

  String name;
  TextEditingController textEditingController = TextEditingController();
  List<Recipy> filteredList = [];
  void searchRecipy(String name) {
    print(foods);
    print(foods.where((foodName) => foodName.recipyname.toLowerCase().startsWith(name))
        .toList(),
    );
    setState(() {
      filteredList = foods.where((foodName) => foodName.recipyname.toLowerCase().startsWith(name))
          .toList();
    });
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        title: Text(
          'Are you Sure?',
        ),
        content: Text(
          'Do you want to exit Application',
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Text(
                "NO",
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () => SystemNavigator.pop(),
              child: Text(
                "YES",
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

  Future<Null> refresh() {
    _loadFood();
    return Future<Null>.value();
  }

  void initState() {
    super.initState();
    _loadFood();
  }

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

  Widget _getDrawer(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.teal,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                'https://articles-images.sftcdn.net/wp-content/uploads/sites/3/2017/08/foodie-apps1.jpg',
              ),
            ),
          ),
          child: Center(
            child: Container(
              child: Text(
                'IndianRasoi',
                style: TextStyle(
                  fontSize: 45.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Desserts',
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(
              builder: (context) => LoadData(
                category: 'Dessert',
                foods: foods,
              ),
            ),
            );
          },
        ),
        ListTile(
          title: Text(
            'Snacks',
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(
              builder: (context) => LoadData(
                category: 'Snacks',
                foods: foods,
              ),
            ),
            );
          },
        ),
        ListTile(
          title: Text(
            'Main Course',
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(
              builder: (context) => LoadData(
                category: 'Main Course',
                foods: foods,
              ),
            ),
            );
          },
        ),
        ListTile(
          title: Text(
            'Breakfast',
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(
              builder: (context) => LoadData(
                category: 'Breakfast',
                foods: foods,
              ),
            ),
            );
          },
        ),
        ListTile(
          title: Text(
            'Lunch',
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(
              builder: (context) => LoadData(
                category: 'Lunch',
                foods: foods,
              ),
            ),
            );
          },
        ),
        ListTile(
          title: Text(
            'Dinner',
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(
              builder: (context) => LoadData(
                category: 'Dinner',
                foods: foods,
              ),
            ),
            );
          },
        ),
        ListTile(
          title: Text(
            'EasyCook',
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(
              builder: (context) => LoadData(
                category: 'EasyCook',
                foods: foods,
              ),
            ),
            );
          },
        ),
        ListTile(
          title: Text(
            'Our Weekly Stories',
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(
              builder: (context) => OurStories(),
            ),
            );
          },
        ),
        Divider(
          color: Colors.black,
        ),
        ListTile(
          title: Text(
            'About Developers',
          ),
          onTap: () {
            Navigator.push(
              context,MaterialPageRoute(
              builder: (context) => Developers(),
            ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Column(
        children: <Widget>[
          Container(
            height: 70.0,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35.0),
                bottomRight: Radius.circular(35.0),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 1.0,
                      left: 5.0,
                      right: 10.0,
                    ),
                    height: 50.0,
                    width: MediaQuery.of(context).size.width - 10,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                    ),
                    child: TextField(
                      autofocus: false,
                      focusNode: FocusNode(
                        canRequestFocus: false,
                      ),
                      showCursor: false,
                      controller: textEditingController,
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(12.0),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 30.0,
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchRecipy(
                            value,
                          );
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
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
          itemCount: filteredList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          padding: EdgeInsets.all(10.0),
          itemBuilder: _buildItems,
        ),
      ),
    );
  }

  Widget _buildItems(BuildContext context, int index) {
    Recipy rec = filteredList[index];
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Recipes',
          ),
          centerTitle: true,
          elevation: 0.0,
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
        ),
        drawer: Drawer(
          child: _getDrawer(context),
        ),
        body: _buildBody(context),
      ),
    );
  }
}