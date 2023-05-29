import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends ChangeNotifier {
  String? get userName => _name;
  String? get mailid => _mail;
  bool? get isnull => _isnull;
  String? get userProf => _photoUrl;
  bool get isLoggedIn => _isLoggedIn;
  bool _isLoggedIn = false;

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isnull = false;
  String? _photoUrl;
  String? _name;
  String? _mail;

  void reset() {
    // Reset any necessary properties or state variables here
    // For example, reset the 'isnull' property
    _isnull = false;
  }

  Future<User?> handleGoogleSignIn() async {
    try {
      // Start the Google Sign-In process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        _isnull = true;
        // User canceled the sign-in
        return null;
      }

      

      // Obtain the auth details from the Google Sign-In
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential using the Google auth token
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credentials
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Fetch additional user information from the userCredential.user object
      _name = googleUser.displayName;
      _photoUrl = googleUser.photoUrl!.replaceAll("s96-c", "s192-c");
      _mail = googleUser.email;

      print('Profile Picture URL: $_photoUrl'); // Check the profile picture URL

      notifyListeners();

      // Return the user information
      return userCredential.user;
    } catch (e) {
      // Handle the sign-in error
      print('Error signing in with Google: $e');
      return null;
    }
  }

  Future handleGoogleSignOut(BuildContext context) async {

    try {
      // Sign out from Firebase and Google
      await _auth.signOut();
      await _googleSignIn
          .signOut()
          .then((value) => Navigator.pushNamedAndRemoveUntil(
                context,
                '/signout',
                (route) => false,
              )); // Navigate to the sign-in screen after successful sign out

  

      notifyListeners();
    } catch (e) {
      // Handle the sign-out error
      print('Error signing out: $e');
    }
  }

 
}
