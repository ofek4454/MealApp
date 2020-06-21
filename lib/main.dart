import 'package:flutter/material.dart';

import './screens/home_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/settings_screen.dart';
import './dataBases/maels_DB.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    SettingsScreen.gluten: false,
    SettingsScreen.lactose: false,
    SettingsScreen.vegetarian: false,
    SettingsScreen.vegan: false,
  };

  List<Meal> _availibleMeals = MEALS;
  List<Meal> _favoriteMeal = [];

  void setAsFavorite(Meal myMeal) {
    var index = _favoriteMeal.indexWhere((meal) => meal.id == myMeal.id);
      if (index >= 0) {
        setState(() {
          _favoriteMeal.removeAt(index);
        });
      } else {
        setState(() {
          _favoriteMeal.add(myMeal);
        });
      }
  }

  bool isMealFavorite(Meal myMeal){
    return _favoriteMeal.any((meal) => meal.id == myMeal.id);
  }

  void _setFilters(Map<String, bool> newFilters) {
    setState(() {
      filters = newFilters;
      _availibleMeals = MEALS.where((meal) {
        if (filters[SettingsScreen.gluten] && !meal.isGlutenFree) {
          return false;
        }
        if (filters[SettingsScreen.lactose] && !meal.isLactoseFree) {
          return false;
        }
        if (filters[SettingsScreen.vegetarian] && !meal.isVegetarian) {
          return false;
        }
        if (filters[SettingsScreen.vegan] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.teal,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      home: HomeScreen(_favoriteMeal),
      routes: {
        CategoryMealsScreen.routName: (ctx) =>
            CategoryMealsScreen(_availibleMeals),
        MealDetailsScreen.rountName: (ctx) => MealDetailsScreen(setAsFavorite , isMealFavorite),
        SettingsScreen.routName: (ctx) => SettingsScreen(filters, _setFilters),
      },
    );
  }
}
