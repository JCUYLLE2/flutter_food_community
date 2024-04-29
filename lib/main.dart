import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_community/components/home_screen';
import 'package:flutter_food_community/components/login_screen';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              if (snapshot.hasData) {
                // Gebruiker is ingelogd, toon de hoofdinhoud van de app
                return HomeScreen();
              } else {
                // Gebruiker is niet ingelogd, toon het inlogscherm
                return LoginScreen();
              }
            }
          },
        ),
      ),
    );
  }
}
