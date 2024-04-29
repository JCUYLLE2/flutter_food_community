// TODO Implement this library.import 'package:google_sign_in/google_sign_in.dart';

import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      return await _googleSignIn.signIn();
    } catch (error) {
      print('Error signing in with Google: $error');
      return null;
    }
  }
}
