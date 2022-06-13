import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _buildListTile({
    required String title,
    required IconData icon,
    void Function()? onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.center,
            child: Text(
              '!CooKBooK',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).canvasColor,
              ),
            ),
          ),
          const SizedBox(height: 40),
          _buildListTile(
            title: 'Meals',
            icon: Icons.restaurant,
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          _buildListTile(
            title: 'Filters',
            icon: Icons.settings,
            onTap: () {
              Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
