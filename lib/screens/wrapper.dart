import 'package:firebase_auth/firebase_auth.dart';
import 'package:namer_app/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    // return either the Home or Authenticate widget
    if(user == null){
      print("user is not logged in, redirect to login form, user info:");
      print(user);
      return AuthenticationScreen();
    } else{
      print("user is logged in, redirect to Home");
      return HomeScreen();
    }
  }
}