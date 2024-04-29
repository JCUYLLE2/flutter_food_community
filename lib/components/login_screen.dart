import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_food_community/services/google_sign_in_service.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GoogleSignInService _googleSignInService = GoogleSignInService();

  void _signInWithEmailAndPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Fout bij inloggen: $e"),
        ),
      );
    }
  }

  void _signInWithGoogle(BuildContext context) async {
    final user = await _googleSignInService.signInWithGoogle();
    if (user != null) {
      // Handleer de aangemelde gebruiker, bijvoorbeeld navigeren naar de HomeScreen
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Fout bij inloggen met Google"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inloggen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Wachtwoord'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _signInWithEmailAndPassword(context),
              child: Text('Inloggen'),
            ),
            SizedBox(height: 8.0), // Voeg ruimte toe tussen de knoppen
            ElevatedButton(
              onPressed: () => _signInWithGoogle(context),
              child: Text('Inloggen met Google'),
            ),
          ],
        ),
      ),
    );
  }
}
