import 'package:flutter/material.dart';
import 'package:foodi/models/meal.dart';
import 'package:foodi/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String routeName = "/meal_screen";
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categorytitle;
  List<Meal> categoryMeals;
//---------------didChangeDependendies is used because context value returns only after initState-----//
  @override
  void didChangeDependencies() {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    categorytitle = routeArgs["title"];
    final categoryId = routeArgs["id"];
    categoryMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, i) {
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
