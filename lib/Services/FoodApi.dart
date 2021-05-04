import 'dart:async';
import 'package:indiarasoi/Models/recipy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodApi {
  Future<List<Recipy>> getAllRecipy() async {
    return (await Firestore.instance.collection('recipies').getDocuments())
        .documents
        .map((snapShot) => _fromDocumentSnapshot(snapShot))
        .toList();
  }

  Recipy _fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data;
    return Recipy(
      documentId: snapshot.documentID,
      id: data['id'],
      recipyname: data['recipyname'],
      calories: data['calories'],
      protein: data['protein'],
      carbohydrates: data['carbohydrates'],
      fat: data['fat'],
      categories: List<String>.from(data['categories']),
      ingredients: List<String>.from(data['ingredients']),
      stepsno: data['stepsno'],
      steps: List<String>.from(data['steps']),
      itemimage: data['itemimage'],
    );
  }
}
