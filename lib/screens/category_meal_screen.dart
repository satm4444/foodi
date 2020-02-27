import 'package:flutter/material.dart';
import 'package:foodi/dummy_data.dart';
import 'package:foodi/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String title;
  // CategoryMealScreen(this.title);

  static const String routeName = "/meal_screen";
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    final categorytitle = routeArgs["title"];
    final categoryId = routeArgs["id"];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, i) {
        return MealItem(
            title: categoryMeals[i].title,
            imageUrl: categoryMeals[i].imageUrl,
            id: categoryMeals[i].id,
            duration: categoryMeals[i].duration,
            complexity: categoryMeals[i].complexity,
            affordability: categoryMeals[i].affordability);
      }),
    );
  }
}
