import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CatagoriesScreen extends StatelessWidget {
  const CatagoriesScreen({super.key});

  @override //builder is used to build the dynamic amount of the data.
  Widget build(BuildContext context) {
    //sliver is the scrollable area,
    return GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2, //is the height to width ratio of child
          mainAxisSpacing: 20, //space between column and the row in the grid
          crossAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                  id: catData.id, title: catData.title, color: catData.color),
            )
            .toList() //converting the data into the widget,
        );
  }
}
