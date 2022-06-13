import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key, required this.changeFilters, required this.currentFilters})
      : super(key: key);
  static const routeName = '/filters';
  final Function changeFilters;
  final Map<String, bool> currentFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gluteenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  void initState() {
    _gluteenFree = widget.currentFilters['gluteen'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;

    super.initState();
  }

  Widget _buildSwitchListtile(String title, bool currentValue, Function(bool) changeValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: changeValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              Map<String, bool> selectedFilters = {
                'gluteen': _gluteenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.changeFilters(selectedFilters);
            },
            icon: const Icon(Icons.save_outlined),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Select your Option.',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
          ),
          _buildSwitchListtile('Gluteen-free', _gluteenFree, (value) {
            setState(() {
              _gluteenFree = value;
            });
          }),
          _buildSwitchListtile('Lactose-free', _lactoseFree, (value) {
            setState(() {
              _lactoseFree = value;
            });
          }),
          _buildSwitchListtile('Vegetarian', _vegetarian, (value) {
            setState(() {
              _vegetarian = value;
            });
          }),
          _buildSwitchListtile('Vegan', _vegan, (value) {
            setState(() {
              _vegan = value;
            });
          }),
        ],
      ),
    );
  }
}
