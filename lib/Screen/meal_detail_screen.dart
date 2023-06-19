import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFavorite;
  final Function isFavorite;
  static const routeName = '/meal-detail';

  const MealDetailScreen(
      {required this.isFavorite, required this.toggleFavorite, super.key});

  Widget builtSectionTitle(BuildContext ctx, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.titleMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) //this only give one fitting element
            {
      // it only return when id matches
      return meal.id == mealId;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: 500,
              margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 95, 95, 95),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              child: const Text(
                'Ingredients',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              width: 500,
              height: 200,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Container(
                  child: Text(
                    selectedMeal.ingredients[index],
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            Container(
              height: 300,
              width: 400,
              child: ListView.builder(
                itemBuilder: ((context, index) => ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    )),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => toggleFavorite(mealId),
          child: Icon(
            isFavorite(mealId) ? Icons.star : Icons.star_border,
          )),
    );
  }
}

              // Container(
              //   margin: const EdgeInsets.only(top: 4),
              //   height: 30,
              //   width: 350,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(5),
              //     boxShadow: const [
              //       BoxShadow(
              //         color: Color.fromARGB(255, 102, 100, 100),
              //         spreadRadius: 1,
              //         blurRadius: 18,
              //         offset: Offset(0, 5),
              //       ),
              //       BoxShadow(
              //         color: Color.fromARGB(255, 214, 211, 211),
              //         offset: Offset(0, 0),
              //       )
              //     ],
              //     // color: const Color.fromARGB(255, 242, 235, 235).withOpacity(.8)),
              //     color: const Color.fromARGB(255, 249, 244, 244),
              //   ),
              //   child: Center(
              //     child: Text(
              //       selectedMeal.title,
              //       style: const TextStyle(
              //         color: Colors.black,
              //         fontSize: 25,
              //       ),
              //     ),
              //   ),
              // ),