import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class SavedsScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  SavedsScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty || favoriteMeals.length == 0
        ? Center(child: Text('No favorite meals!'))
        : LayoutBuilder(
        builder: (ctx, constraints) {
          final cardHeight = constraints.maxHeight *0.4;
          return ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: (ctx, index) {
              return Container(
                width: constraints.maxWidth,
                height: cardHeight,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: MealItem(favoriteMeals[index] , cardHeight),
              );
            },
          );
        },
      );
  }
}
