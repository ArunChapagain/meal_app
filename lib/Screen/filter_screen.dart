import 'package:flutter/material.dart';
import 'package:meal_app/widgets/drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(
      {required this.currentFilters, required this.saveFilters, super.key});

  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegen = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget.currentFilters['gluten']!;
    _isVegen = widget.currentFilters['vegan']!;
    _isVegetarian = widget.currentFilters['vegetarian']!;
    _isLactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String subtitle, var boolValue,
      Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: boolValue,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _isGlutenFree,
                    'vegan': _isVegen,
                    'vegetarian': _isVegetarian,
                    'lactose': _isLactoseFree,
                  };

                  widget.saveFilters(selectedFilters);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals.',
                    _isGlutenFree,
                    (newValue) {  
                      setState(() {
                        _isGlutenFree = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                      'Vegen', 'Only include vegen meals.', _isVegen,
                      (newValue) {
                    setState(() {
                      _isVegen = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                    'Vegeritan',
                    'Only include vegeterian meals.',
                    _isVegetarian,
                    (newValue) {
                      setState(() {
                        _isVegetarian = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Lactose-free',
                    'Only include lactose-free meals.',
                    _isLactoseFree,
                    (newValue) {
                      setState(() {
                        _isLactoseFree = newValue;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
