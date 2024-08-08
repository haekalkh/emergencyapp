import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthServices {
  // Method to sign up a user
  Future<void> signup({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The Password Provided is Too Weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An Account Already Exists with That Email';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: const Color.fromARGB(255, 245, 237, 237),
        textColor: const Color.fromARGB(255, 100, 130, 173),
        fontSize: 14,
      );
    }
  }

  // Method to sign in a user
  Future<void> signin({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No User Found For That Email';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong Password Provided for That User';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: const Color.fromARGB(255, 245, 237, 237),
        textColor: const Color.fromARGB(255, 100, 130, 173),
        fontSize: 14,
      );
    }
  }

  // Method to send a password reset email
  Future<void> forgotPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(
        msg: 'Password reset email sent',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: const Color.fromARGB(255, 245, 237, 237),
        textColor: const Color.fromARGB(255, 100, 130, 173),
        fontSize: 14,
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'The Email Address is Invalid';
      } else if (e.code == 'user-not-found') {
        message = 'No User Found for That Email';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: const Color.fromARGB(255, 245, 237, 237),
        textColor: const Color.fromARGB(255, 100, 130, 173),
        fontSize: 14,
      );
    }
  }
}
