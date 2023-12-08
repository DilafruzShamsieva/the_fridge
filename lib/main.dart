import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:namer_app/screens/wrapper.dart';
import 'package:namer_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'env/env.dart';
import 'services/firebase_options.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:namer_app/services/auth.dart';


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
    return StreamProvider<User?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      )
    );
  }
}
