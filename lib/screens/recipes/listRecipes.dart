import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../models/Recipe.dart';
import '../../services/database/RecipeDatabaseService.dart';
import '../../widgets/nav-drawer.dart';

class ListRecipes extends StatefulWidget {
  @override
  _ListRecipesState createState() => _ListRecipesState();
}

class _ListRecipesState extends State<ListRecipes> {
  // final RecipeDatabaseService recipeDb = RecipeDatabaseService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var collection = FirebaseFirestore.instance.collection("recipes");
  late List<Map<String, dynamic>> items ;
  bool isLoaded = false;

  _displayData() async {
    List<Map<String, dynamic>> tempList =[];
    var data = await collection
        .where("user_id", isEqualTo: _auth.currentUser?.uid).get();
    data.docs.forEach((element) {
      tempList.add(element.data());
    });

    setState(() {
      items = tempList;
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    _displayData();

    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text('List My Recipes:',
          style: TextStyle(color: Colors.white)
        ),
      ),
        body: Center(
            child: isLoaded?ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          side : const BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      leading: const CircleAvatar(
                          backgroundColor: Color(0xff6ae792),
                          child:Icon(Icons.menu_book)
                      ),
                      title: Row(
                        children: [
                          Text("Ingredients:"),
                          SizedBox(width: 10,),
                          Text(items[index]["ingredients"].toString()),
                        ],
                      ),
                    ),
                  );
                }
            ):Container(child:Text("no data"))
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: _displayData,
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

