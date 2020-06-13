import 'package:flutter/material.dart';

import '../models/meal.dart';
import 'package:MealsApp/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal _meal;
  final double cardHeight;

  MealItem(this._meal, this.cardHeight);

  void mealDetailsPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailsScreen.rountName , arguments: _meal);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => mealDetailsPage(context),
      borderRadius: BorderRadius.circular(20),
      focusColor: Theme.of(context).primaryColor,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 8,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Image.network(
                      _meal.imageUrl,
                      height: cardHeight * 0.8,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: Colors.black26,
                    child: Text(
                      _meal.title,
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: SizedBox(
                height: cardHeight * 0.2,
                child: Row(
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
