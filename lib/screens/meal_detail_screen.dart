import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(BuildContext context, child) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFddddda),
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 170,
      width: 350,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere(
      (meal) => meal.id == mealId,
    );
    return Container(
      decoration: BoxDecoration(
        gradient: new LinearGradient(
            colors: [
              const Color(0xFF141e30),
              const Color(0xFF243b55),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    const Color(0xFF141e30),
                    const Color(0xFF243b55),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          title: Text('${selectMeal.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 285,
                width: double.infinity,
                child: Image.network(
                  selectMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Color(0xFF041b2d),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        selectMeal.ingredients[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  itemCount: selectMeal.ingredients.length,
                ),
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                  context,
                  ListView.builder(
                    itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xFF041b2d),
                            child: Text(
                              '# ${(index + 1)}',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          title: Text(
                            selectMeal.steps[index],
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                    itemCount: selectMeal.steps.length,
                  ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          backgroundColor: Colors.white,
          child: Icon(
            isFavorite(mealId) ? Icons.favorite : Icons.favorite_border,
            color: Color(0xFF041b2d),
          ),
          onPressed: () => toggleFavorite(mealId),
        ),
      ),
    );
  }
}
