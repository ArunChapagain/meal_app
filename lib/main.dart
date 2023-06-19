import 'package:flutter/material.dart';
import 'package:meal_app/Screen/category_meal_screen.dart';
import 'package:meal_app/Screen/filter_screen.dart';
import 'package:meal_app/Screen/meal_detail_screen.dart';
import 'package:meal_app/Screen/tab_screen_2.dart';
import 'package:meal_app/dummy_data.dart';
import './models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  final List<Meal> _favoriateMeals = [];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriateMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriateMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriateMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriateMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Meal',
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.pink, primaryColorDark: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromARGB(255, 255, 254, 242),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleMedium: const TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ), //for dark mode use opacity of .2
initialRoute: '/',

      routes: {
        '/': (ctx) => TabScreen2(
              favoriteMeals: _favoriateMeals,
            ),
        CategoryMeal.routeName: (ctx) =>
            CategoryMeal(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(
              toggleFavorite: _toggleFavorite,
              isFavorite: _isMealFavorite,
            ),
        FiltersScreen.routeName: (ctx) =>
            FiltersScreen(currentFilters: _filters, saveFilters: _setFilter)
      },
    );
  }
}

      // home: const CatagoriesScreen(),
      //this function is execuited if unknown errors occors during the navigation
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx) {
      //     return const CatagoriesScreen();
      //   });
      // },

      //unKnown route is executed when flutter fails to buid pages
      // onUnknownRoute: ,

      // initialRoute: '/',
      // routes: {
      //   '/': (ctx) => CatagoriesScreen(),
      //   '/category-meals': (ctx) => CategoryMeal()
      // },