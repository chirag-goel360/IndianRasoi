import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:indiarasoi/Helpers/RecipeDesign.dart';
import 'package:indiarasoi/Models/recipy.dart';
import 'package:indiarasoi/Screens/RecipyInfo.dart';
import 'package:indiarasoi/Services/FoodApi.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipy> foods = [];
  _loadFood() async{
    String fileData = await DefaultAssetBundle.of(context).loadString("assets/food.json");
    setState(() {
      foods = FoodApi.allrecipiesFromJson(fileData);
    });
    print(foods.length);
    print(foods.toString());
  }
  void initState()
  {
    super.initState();
    _loadFood();
  }
  @override
  Widget build(BuildContext context) {
    int f = foods.length;
    print(f);
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(child: _getDrawer(context),),
      body: _buildBody(context,f,foods),
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

Widget _buildBody(BuildContext context,int f,List<Recipy> foods){
  return Container(
    child: GridView.builder(
      primary:false,
      itemCount: f,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (BuildContext context,int index){
        return GridTile(
          child: GestureDetector(onTap: ()=>Navigator.of(context).push(
              MaterialPageRoute(builder:(context)=>RecipyInfo())), child: RecDesign(
            title: foods[index].recipyname,
            imgURL: foods[index].itemimage,)),
        );
      },
    ),
  );
}