import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

enum Complexity {
  Easy,
  Medium,
  Hard,
}

enum Affordability {
  Affordable,
  Expansive,
  Luxury,
}

class Meal{

  final String id;
  final String title;
  final List<String> categories;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.ingredients,
    @required this.steps,
    @required this.isGlutenFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.isLactoseFree
  });

}