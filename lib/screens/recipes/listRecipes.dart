import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../services/database/RecipeDatabaseService.dart';
import '../../widgets/nav-drawer.dart';

class ListRecipes extends StatefulWidget {
  @override
  _ListRecipesState createState() => _ListRecipesState();
}

class _ListRecipesState extends State<ListRecipes> {
  final RecipeDatabaseService recipeDb = RecipeDatabaseService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<String> ingredients = [];
  String ingredient = "";
  String steps = "";

  @override
  Widget build(BuildContext context) {
    //TODO
    final userId = _auth.currentUser?.uid;
    print("hello list my receipts");
    recipeDb.listRecipe(userId!);

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text(
            'My Recipe:',
            style: TextStyle(color: Colors.white)
        ),
      ),
    );
  }
}

