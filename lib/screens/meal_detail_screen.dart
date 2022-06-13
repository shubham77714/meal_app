import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(this.toggleFavouriteMeals, this.isMealFavourite, {Key? key}) : super(key: key);

  static const routeName = '/meal-detail';
  final Function toggleFavouriteMeals;
  final Function isMealFavourite;

  Widget _buildSectionTitle(BuildContext ctx, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.headline1,
      ),
    );
  }

  Widget _buildSectionList({required Widget child, double height = 200}) {
    return Container(
      height: height,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final meal = dummyMeals.singleWhere((meal) {
      return meal.id == id;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: meal.id,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              _buildSectionTitle(context, 'Ingredients'),
              _buildSectionList(
                child: ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).colorScheme.background,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                        child: Text(
                          meal.ingredients[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
              _buildSectionTitle(context, 'Steps'),
              _buildSectionList(
                height: 300,
                child: ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${index + 1}'),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        const Divider(thickness: 1.5),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isMealFavourite(meal.id) as bool
            ? const Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : const Icon(Icons.favorite_border),
        onPressed: () {
          toggleFavouriteMeals(meal.id);
          //example on how to pop context with the data sending back to the previous route
          // Navigator.pop(context,meal.id);  //
        },
      ),
    );
  }
}
