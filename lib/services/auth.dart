import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

// sign in with email and password


// register with email and password


// sign out
  Future signOut() async{
    try {
      print("User is signing out ..");
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}