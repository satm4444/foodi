import 'package:flutter/material.dart';
import 'package:foodi/widgets/CategoryItem.dart';
import 'package:foodi/dummy_data.dart';

class CategoryOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome to Foodi",
        ),
      ),
      body: GridView(
        padding: EdgeInsets.all(15.0),
        children: DUMMY_CATEGORIES.map((catData) {
          return CategoryItem(catData.id, catData.title, catData.color);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20.0,
        ),
      ),
    );
  }
}
