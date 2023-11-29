import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _ingredientsController = TextEditingController();

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
                String ingredients = _ingredientsController.text.trim();

                // test print the ingredients to the console
                print('Suggested Menu for Ingredients: $ingredients');
              },
              child: Text('Suggest Menu'),
            ),
          ],
        ),
      ),
    );
  }
}
