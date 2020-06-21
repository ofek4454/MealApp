import 'package:flutter/material.dart';

import '../dataBases/category_DB.dart';
import '../widgets/category_item.dart';

class CategorysScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(5),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: CATEGORIES.map((category) => CategoryItem(category)).toList(),
    );
  }
}
