import 'package:flutter/material.dart';

import '../recipes/recipes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _ingredientsController = TextEditingController();
  List<String> ingredients = [];

  void _navigateToRecipeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            RecipesScreen(ingredients: ingredients.join(", ")),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to The Fridge'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _ingredientsController,
              decoration: InputDecoration(labelText: 'Enter Ingredients'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String ingred = _ingredientsController.text.trim();
                if (!ingredients.contains(ingred)) {
                  ingredients.add(ingred);
                }
                setState(() {});

                // test print the ingredients to the console
                print('Suggested Menu for Ingredients: $ingredients');
              },
              child: Text('Add Ingredient'),
            ),
            ElevatedButton(
              onPressed: () {
                // test print the ingredients to the console
                print('Suggested Menu for Ingredients: $ingredients');
                _navigateToRecipeScreen(context);
              },
              child: Text('Suggest Menu'),
            ),
            Text('Click an Ingredient to Remove It'),
            Expanded(
              child: ingredients.isNotEmpty
                  ? ListView.builder(
                      itemCount: ingredients.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(ingredients[index]),
                            onTap: () {
                              ingredients.remove(ingredients[index]);
                              setState(() {});
                            });
                      },
                    )
                  : Text('No Ingredients Added'),
            ),
          ],
        ),
      ),
    );
  }
}
