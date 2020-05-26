import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
  FoodApi ap=FoodApi();
  _loadFood() async{
    foods = await ap.getAllRecipy();
    setState(() {
      foods=foods;
    });
    print(foods.length);
    print(foods.toString());
  }

  Future<Null> refresh(){
    _loadFood();
    return new Future<Null>.value();
  }

  void initState()
  {
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

  Widget _getDrawer(BuildContext context){
  return ListView(
    children: <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.teal,
          image: DecorationImage(
            fit: BoxFit.fill,
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
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadData()));},
      ),
      ListTile(
        title: Text('Snacks'),
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadData()));},
      ),
      ListTile(
        title: Text('Main Course'),
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadData()));},
      ),
      ListTile(
        title: Text('Breakfast'),
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadData()));},
      ),
      ListTile(
        title: Text('Lunch'),
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadData()));},
      ),
      ListTile(
        title: Text('Dinner'),
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadData()));},
      ),
      ListTile(
        title: Text('EasyCook'),
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadData()));},
      ),
      Divider(
        color: Colors.black,
      ),
      ListTile(
        title: Text('About Developers'),
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>DevelopersInfo()));},
      ),
    ],
  );
}

Widget _buildBody(BuildContext context){
  return Container(
    child: GridView.builder(
      primary:false,
      itemCount: foods.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
      padding: const EdgeInsets.all(10.0),
      itemBuilder:_buildItems,
    ),
  );
}

Widget _buildItems(BuildContext context, int index){
  Recipy rec = foods[index];  
  return GridTile(
          child: GestureDetector(onTap: ()=>_navigateToDetails(rec), child: RecDesign(
            title:rec.recipyname,
            imgURL:rec.itemimage,
            )
          ),
        );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(child: _getDrawer(context),),
      body: _buildBody(context),
    );
  }
}