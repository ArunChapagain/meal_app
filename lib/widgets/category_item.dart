import 'package:flutter/material.dart';
import 'package:meal_app/Screen/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({
    required this.id,
    required this.title,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => navigateToMealScreen(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(.5),
                  color,
                ],
                begin: Alignment.topLeft,
                end: Alignment.center,
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 109, 109, 109),
                  spreadRadius: 1,
                  blurRadius: 12,
                  offset: Offset(0, 5),
                ),
                BoxShadow(
                  color: Color.fromARGB(255, 214, 211, 211),
                  offset: Offset(0, 0),
                )
              ]),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Color.fromRGBO(227, 227, 227, 1),
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
              // style: Theme.of(context).textTheme().titleMedium,
            ),
          ),
        ),
      ),
    );
  }

  void navigateToMealScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      // '/category-meals',
      CategoryMeal.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }
  // void navigateToMealScreen(BuildContext ctx) {// this is old technique so it is not used
  //   Navigator.push(
  //     ctx,
  //     MaterialPageRoute(
  //       builder: (_) {
  //         return CategoryMeal(categoryId: id, title: title);
  //       },
  //     ),
  //   );
  // }
}
