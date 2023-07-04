import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Screen/catagories_screen.dart';
import 'package:meal_app/Screen/favoriate_screen.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/drawer.dart';

class TabScreen2 extends ConsumerStatefulWidget {
  final List<Meal> favoriteMeals;

  const TabScreen2({required this.favoriteMeals, super.key});

  @override
  ConsumerState<TabScreen2> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen2> {
  late List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': const CatagoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoriateScreen(
          favoriateMeals: widget.favoriteMeals,
        ),
        'title': 'Favoriate',
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.pink,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.pink,
              icon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoriates'),
        ],
      ),
    );
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    //flutter will automatically provide the index

    setState(() {
      _selectedPageIndex = index;
    });
  }
}
