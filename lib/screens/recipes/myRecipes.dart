import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../widgets/nav-drawer.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  List<String> recipes = [];
  final TextEditingController _ingredientsController = TextEditingController();
  List<String> ingredients = [];
  String steps = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text(
            'Create A Recipe:',
            style: TextStyle(color: Colors.white)
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex:3,
            child: Container(
                color: Colors.grey[100],
                padding: EdgeInsets.all(20.0),
                child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          String ingred = _ingredientsController.text.trim();
                          if (!ingredients.contains(ingred)) {
                            ingredients.add(ingred);
                          }
                          setState(() {});
                        },
                        child: Text('Add Ingredient'),
                      ),
                    ]
                )
            ),
          ),
          Expanded(
             flex:5,
             child: Container(
                color: Colors.grey[300],
                padding: EdgeInsets.all(20.0),
                child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          String ingred = _ingredientsController.text.trim();
                          if (!ingredients.contains(ingred)) {
                            ingredients.add(ingred);
                          }
                          setState(() {});
                        },
                        child: Text('Save Recipe'),
                      ),
                    ]
                ),
            )
          ),
        ],
      ),
    );
  }
}

