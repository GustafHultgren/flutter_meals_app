import 'package:flutter/material.dart';
import 'package:flutter_meals_app/meal_item.dart';
import 'dummy-data.dart';
import 'models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String title;
  List<Meal> meals;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_initialized) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      title = routeArgs['title'];
      meals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _initialized = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String id) {
    setState(() {
      meals.removeWhere((m) => m.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) {
            final meal = meals[index];
            return MealItem(
              id: meal.id,
              title: meal.title,
              affordability: meal.affordability,
              imageUrl: meal.imageUrl,
              duration: meal.duration,
              complexity: meal.complexity,
              removeMeal: _removeMeal,
            );
          }),
    );
  }
}
