import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class DatabaseService {
   final String uid;
   DatabaseService({ required this.uid });
   // collection reference
   final CollectionReference recipeCollection = FirebaseFirestore.instance.collection('recipes');

   Future createRecipeData(String sugar, String name, int strength) async{
      var uuid = Uuid().v1();
      print("create a recipe data");
      return await recipeCollection.doc(uid).set({
         'recipe_id': uuid,
         'user_id': uid,
         'sugars': sugar,
         'name': name,
         'strength': strength,
      });
   }
}