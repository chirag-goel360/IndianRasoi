import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gradients/flutter_gradients.dart';
import 'package:indiarasoi/Helpers/RecipeDesign.dart';
import 'package:indiarasoi/Screens/RecipyInfo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(child: _getDrawer(context) ,),
      body: _buildBody(context),
    );
  }
}


Widget _getDrawer(BuildContext context){
  return ListView(
    children: <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.teal,
          image: DecorationImage(
              fit: BoxFit.cover,
              image:  NetworkImage('https://articles-images.sftcdn.net/wp-content/uploads/sites/3/2017/08/foodie-apps1.jpg'),
            ),
        ),
        child: Center(
          child: Container(
            child: Text(
              'IndianRasoi',
              style: TextStyle(
                fontSize: 45.0,
                color: Colors.black
              ),),
          ),
        )
      ,),
      ListTile(
        title: Text('Desserts'),
      ),
      ListTile(
        title: Text('Snacks'),
      ),
      ListTile(
        title: Text('Main Course'),
      ),
      ListTile(
        title: Text('Chinese'),
      ),
      ListTile(
        title: Text('Italian'),
      ),
      ListTile(
        title: Text('Mexican'),
      ),       
    ],
  );
}

Widget _buildBody(BuildContext context){
  return Container(
    child: GridView.count(
        primary:false,
        padding: const EdgeInsets.all(10.0),
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 15.0,
        crossAxisCount: 2,
        children: List<Widget>.generate(
          16, (index){
            return GridTile(
              child: GestureDetector(onTap: ()=>Navigator.of(context).push(
                MaterialPageRoute(builder:(context)=>RecipyInfo())), child: RecDesign(title: 'Bhature',)),
              );
          }
        ),
      ),
  );
}