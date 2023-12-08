import 'package:namer_app/screens/authenticate/authenticate.dart';
import 'package:namer_app/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // return either the Home or Authenticate widget
    return AuthenticationScreen();
  }
}