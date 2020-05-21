import 'dart:convert';
import 'package:indiarasoi/Models/recipy.dart';

class FoodApi{
  static List<Recipy> allrecipiesFromJson(String jsonData)
  {
    List<Recipy> recipies = [];
    json.decode(jsonData)['recipies'].forEach((recipys) => recipies.add(_fromMap(recipys)));
    return recipies;
  }

  static Recipy _fromMap(Map<String,dynamic> map)
  {
    return new Recipy(
        id: map['id'],
        recipyname: map['recipyname'],
        calories: map['calories'],
        protein: map['protein'],
        carbohydrates: map['carbohydrates'],
        fat: map['fat'],
        categories: new List<String>.from(map['categories']),
        ingredients: new List<String>.from(map['ingredients']),
        stepsno: map['stepsno'],
        steps: new List<String>.from(map['steps']),
        itemimage: map['itemimage']
    );
  }
}