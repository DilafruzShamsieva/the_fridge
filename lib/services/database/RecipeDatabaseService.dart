import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class RecipeDatabaseService {
   // collection reference
   final CollectionReference recipeCollection = FirebaseFirestore.instance.collection('recipes');

   Future createRecipe(String userId,
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
}