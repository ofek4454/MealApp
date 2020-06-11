import 'package:flutter/material.dart';

import '../dataBases/category_DB.dart';
import '../widgets/category_item.dart';

class CategorysScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals App'),
        leading: IconButton(
            icon: Icon(
              Icons.menu,
            ),
            onPressed: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: CATEGORIES.map((category) => CategoryItem(category)).toList(),
        ),
      ),
    );
  }
}