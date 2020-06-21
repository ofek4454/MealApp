import 'package:MealsApp/models/meal.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routName = '/category-maels';

  final List<Meal> availibleMeals;

  CategoryMealsScreen(this.availibleMeals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = availibleMeals.where((meal) => meal.categories.contains(category.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('${category.title}'),
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          final cardHeight = constraints.maxHeight *0.4;
          return ListView.builder(
            itemCount: categoryMeals.length,
            itemBuilder: (ctx, index) {
              return Container(
                width: constraints.maxWidth,
                height: cardHeight,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: MealItem(categoryMeals[index] , cardHeight),
              );
            },
          );
        },
      ),
    );
  }
}
