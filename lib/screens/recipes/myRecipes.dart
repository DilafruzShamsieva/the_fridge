import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../widgets/nav-drawer.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  List<String> recipes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Generated Recipes  123:'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ingredients:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
