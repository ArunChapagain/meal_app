import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/recipe_item.dart';

class CategoryMeal extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMeal(
  //     {super.key, required this.categoryId, required this.title});

  static const routeName = '/category-meals';

  final List<Meal> availableMeals;
  const CategoryMeal({required this.availableMeals, super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments
        as Map<String, String>; // map with string keys and string value
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return RecipeItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imgUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
