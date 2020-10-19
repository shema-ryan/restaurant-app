import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../models/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        children: DUMMY_CATEGORIES
            .map((data) => CategoryItem(
                  title: data.title,
                  color: data.color,
                  id: data.id,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
        ),
      ),
    );
  }
}
