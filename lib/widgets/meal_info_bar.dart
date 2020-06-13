import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealInfoBar extends StatelessWidget {
  final Meal _meal;

  MealInfoBar(this._meal);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.access_time),
            SizedBox(
              width: 10,
            ),
            Text('${_meal.duration} min'),
          ],
        ),
        Row(
          children: <Widget>[
            Icon(Icons.fitness_center),
            SizedBox(
              width: 10,
            ),
            Text(_meal.complexity.toString().split('.')[1]),
          ],
        ),
        Row(
          children: <Widget>[
            Icon(Icons.local_atm),
            SizedBox(
              width: 10,
            ),
            Text(_meal.affordability.toString().split('.')[1]),
          ],
        ),
      ],
    );
  }
}
