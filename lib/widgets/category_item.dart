import 'package:flutter/material.dart';

import '../models/category.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category _category;

  const CategoryItem(this._category);

  void pageCategoryNavigator(BuildContext ctx){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
      return CategoryMealsScreen(category: _category);
    },),);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pageCategoryNavigator(context),
      borderRadius: BorderRadius.circular(15),
      focusColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _category.bgColor.withOpacity(0.7),
              _category.bgColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            _category.title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }
}
