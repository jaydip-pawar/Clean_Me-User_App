import 'package:clean_me/models/dialog_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationProvider with ChangeNotifier {

  void login(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return showDialog(
          context: context,
          builder: (_) => const CustomAlertDialog(
            title: 'Sign in',
            description:
                'Sorry, we cant\'t find an account with this email address. Please try again or create a new account.',
            bText: 'Try again',
          ),
        );
      } else if (e.code == 'wrong-password') {
        return showDialog(
          context: context,
          builder: (_) => const CustomAlertDialog(
            title: 'Incorrect Password',
            description: 'Your username or password is incorrect.',
            bText: 'Try again',
          ),
        );
      }
    }
  }

  void signUp(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return showDialog(
          context: context,
          builder: (_) => const CustomAlertDialog(
            title: 'Email address already in use',
            description: 'Please sign in.',
            bText: 'OK',
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void signInWithGoogle() async {
    User _user;

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    try {
      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      _user = userCredential.user!;
      final uid = _user.uid;
      await FirebaseFirestore.instance.collection("customer").doc(uid).get();
    } catch (e) {
      print(e);
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().disconnect();
    await GoogleSignIn().signOut();
  }

}
