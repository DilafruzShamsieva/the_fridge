import 'package:namer_app/services/registration.dart';
import 'package:namer_app/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../shared/loading.dart';


class AuthenticationScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}


class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool showSignIn = true;
  bool loading = false;

  String email = '';
  String password = '';

  void _navigateToRegistration() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    //TODO: toggleView #11
    bool showSignIn = true;
    void toggleView() {
      setState(() => showSignIn = !showSignIn);
    }
    //TODO
    //return loading? Loading() : Scaffold(
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text(
          'The Fridge',
          //TODO: fix color
          style: TextStyle(color: Colors.white)
        ),

      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          //mainAxisAlignment: MainAxisAlignment.center,
          child: Column(
            children: <Widget>[
            TextFormField(
              onChanged: (val){
                setState(() => email = val.trim().toLowerCase());
              },
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              onChanged: (val){
                setState(() => password = val);
              },
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400],
                minimumSize: Size(100, 40)
              ),
              onPressed: _navigateToRegistration,
              child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white)
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  minimumSize: Size(100, 40)
              ),
              onPressed: () async {
                setState(() => loading = true);

                try {
                  UserCredential userCredential =
                  await _auth.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  // Check if the sign-in was successful
                  final user = userCredential.user;
                  if (user != null) {
                    // Navigate to the home page
                    //TODO: fix suggestion
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } else {
                    print('User not signed in');
                    loading = false;
                  }
                } catch (e) {
                  loading = false;
                  print('Error signing in: $e');
                  // Handle sign-in error
                }
              },
              child: Text('Sign In',
                style: TextStyle(color: Colors.white)
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}