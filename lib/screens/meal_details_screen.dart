import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_info_bar.dart';
import '../dataBases/category_DB.dart';
import '../models/category.dart';

class MealDetailsScreen extends StatelessWidget {
  static const rountName = '/meal-details';

  Widget buildTitleText(BuildContext ctx, String text) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.title,
      ),
    );
  }

  Widget buildDecorationContainer({Widget child, double height}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white10,
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: height,
      child: child,
    );
  }

  String mealCategoriesText(List<Category> mealCategories) {
    String categories = '';
    for (int i = 0; i < mealCategories.length; i++) {
      categories = categories + mealCategories[i].title + " , ";
    }
    return categories.substring(0, categories.length - 2);
  }

  @override
  Widget build(BuildContext context) {
    final _meal = ModalRoute.of(context).settings.arguments as Meal;
    final mealCategories = CATEGORIES
        .where((category) => _meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
          title: Text(
        _meal.title,
      )),
      body: LayoutBuilder(
        builder: (ctx, constranits) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    Image.network(
                      _meal.imageUrl,
                      height: constranits.maxHeight * 0.35,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black26,
                      child: Text(
                        _meal.title,
                        style: Theme.of(context).textTheme.title.copyWith(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: MealInfoBar(_meal),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.topLeft,
                  child: Text(mealCategoriesText(mealCategories)),
                ),
                buildTitleText(context, 'ingredients: '),
                buildDecorationContainer(
                  height: constranits.maxHeight * 0.3,
                  child: ListView.builder(
                    itemCount: _meal.ingredients.length,
                    itemBuilder: (ctx, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          _meal.ingredients[index],
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ),
                  ),
                ),
                buildTitleText(context, 'steps(${_meal.steps.length}): '),
                buildDecorationContainer(
                  height: constranits.maxHeight * 0.5,
                  child: ListView.builder(
                    itemCount: _meal.steps.length,
                    itemBuilder: (ctx, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            '${index + 1}',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                        title: Text(
                          _meal.steps[index],
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
