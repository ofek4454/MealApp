import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  
  final Category category;

  CategoryMealsScreen({@required this.category});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('meals of category: ${category.title}'),
      ),
      body: Center(
        child: Text('new page pop'),
      ),
    );
  }
}
