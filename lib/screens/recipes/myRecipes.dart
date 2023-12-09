import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../services/database/RecipeDatabaseService.dart';
import '../../widgets/nav-drawer.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  final RecipeDatabaseService recipeDb = RecipeDatabaseService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<String> ingredients = [];
  String ingredient = "";
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
                padding: EdgeInsets.all(10.0),
                child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          if (ingredient!= "" && !ingredients.contains(ingredient)) {
                            ingredients.add(ingredient);
                          }
                          setState(() {});
                          print(ingredients);
                        },
                        child: Text('Add Ingredient'),
                      ),
                      Text('Click an Ingredient to Remove It'),
                      TextField(
                        onChanged: (val){
                          setState(() => ingredient = val);
                        },
                        decoration: InputDecoration(labelText: 'Enter Ingredients'),
                      ),
                      SizedBox(height: 16.0),
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
                            : Text('No Ingredients Added',
                            style: TextStyle(color:Colors.red)
                        ),
                      ),
                    ]
                )
            ),
          ),
          Expanded(
             flex:5,
             child: Container(
                color: Colors.grey[300],
                padding: EdgeInsets.all(10.0),
                child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          if(ingredients.isNotEmpty && steps.isNotEmpty) {
                            final userId = _auth.currentUser?.uid;
                            recipeDb.createRecipe(userId!, ingredients, steps);
                            setState(() {});
                          }
                        },
                        child: Text('Save Recipe'),
                      ),
                      SizedBox(
                        height: 400, //     <-- TextField expands to this height.
                        child: TextFormField(
                          maxLines: null, // Set this
                          expands: true, // and this
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: 'Write preparation steps:',
                            filled: true,
                          ),
                          onChanged: (val){
                            setState(() => steps = val);
                          },
                        ),
                      )
                    ]
                ),
            )
          ),
        ],
      ),
    );
  }
}

