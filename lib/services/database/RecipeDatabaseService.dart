import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../models/Recipe.dart';

class RecipeDatabaseService {
   // collection reference
   final CollectionReference recipeCollection = FirebaseFirestore.instance.collection('recipes');

   Future createUserRecipe(String userId,
       List<String> ingredients,
       String prepSteps
    ) async{
      var uuid = Uuid().v1();
      print("creating a recipe data by user: $userId");
      return await recipeCollection.doc(uuid).set({
         'recipe_id': uuid,
         'user_id': userId,
         'ingredients': ingredients,
         'prepSteps': prepSteps,
      });
   }

   Future<List<Recipe>> listRecipesByUserId(String userId) async{
      print("list a recipe data by user: $userId");
      QuerySnapshot querySnapshot = await recipeCollection
          .where("user_id", isEqualTo: userId)
          .get();

      List<Recipe> recipes = [];
      querySnapshot.docs.forEach((doc) {
         recipes.add(
             Recipe(
                recipe_id: doc["recipe_id"],
                ingredients: List<String>.from(doc["ingredients"]),
                prepSteps: doc["prepSteps"],
            )
         );
      });
      return recipes;
   }
}