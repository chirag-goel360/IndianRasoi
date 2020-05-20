import 'package:meta/meta.dart';

class Recipy{
  final int id;
  final String recipyname;
  final double calories;
  final double protein;
  final double carbohydrates;
  final double fat;
  final List<String> ingredients;
  final int stepsno;
  final List<String> steps;
  final String itemimage;

  Recipy({
    @required this.id,
    @required this.recipyname,
    @required this.calories,
    @required this.protein,
    @required this.carbohydrates,
    @required this.fat,
    @required this.ingredients,
    @required this.stepsno,
    @required this.steps,
    @required this.itemimage,
  });
}