import 'package:flutter/material.dart';
import 'package:namer_app/screens/authenticate/authenticate.dart';
import 'package:namer_app/screens/home/home.dart';
import 'package:namer_app/services/auth.dart';
import 'package:namer_app/screens/recipes/myRecipes.dart';

class NavDrawer extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/TheFridge.png'))),
            child: null,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.menu_book),
            title: Text('My Recipes'),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Recipes()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.storage),
            title: Text('Ingredients'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Shopping List'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onLongPress: () async{
              await _auth.signOut();
              //TODO: fix suggestion
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AuthenticationScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}