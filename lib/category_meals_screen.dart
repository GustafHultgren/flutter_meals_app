import 'package:flutter/material.dart';
import 'package:flutter_meals_app/meal_item.dart';
import 'dummy-data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['categoryTitle'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index) {
        final meal = categoryMeals[index];
        return MealItem(
          title: meal.title,
          affordability: meal.affordability,
          imageUrl: meal.imageUrl,
          duration: meal.duration,
          complexity: meal.complexity,
        );
      }),
    );
  }
}
