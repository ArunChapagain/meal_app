import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/recipe_item.dart';

class FavoriateScreen extends StatelessWidget {
  final List<Meal> favoriateMeals;

  const FavoriateScreen({required this.favoriateMeals, super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriateMeals.isEmpty) {
      return const Center(
        child: Text(
          'No favoriate meals selected.',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return RecipeItem(
            id: favoriateMeals[index].id,
            title: favoriateMeals[index].title,
            imgUrl: favoriateMeals[index].imageUrl,
            duration: favoriateMeals[index].duration,
            complexity: favoriateMeals[index].complexity,
            affordability: favoriateMeals[index].affordability,
          );
        },
        itemCount: favoriateMeals.length,
      );
    }
  }
}
