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
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
        final meal = categoryMeals[index];
        return MealItem(
          id: meal.id,
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
