import 'package:namer_app/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'env/env.dart';
import 'services/firebase_options.dart';
import 'package:dart_openai/dart_openai.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //OpenAI.apiKey = Env.apiKey;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Fridge',
      home: AuthenticationScreen(),
    );
  }
}
