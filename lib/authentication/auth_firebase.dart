import 'package:cris2/my_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../home_page.dart';
import '../login_page.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> verifyPhoneNumber(
      {
        required String phoneNumber,
        required Function onVerificationCompleted,
        required Function(FirebaseAuthException) onVerificationFailed,
        required Function(String, int?) onCodeSent,
      }
      ) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credential) {
          onVerificationCompleted();
        },
        verificationFailed: onVerificationFailed,
        codeSent: onCodeSent,
        codeAutoRetrievalTimeout: (verificationId) {
          // Handle auto-retrieval timeout if needed
        },
      );
    } catch (error) {
      handleAuthError(error);
    }
  }

  Future<void> signInWithOTP(
      {
        required String verificationId,
        required String verificationCode,
      }
      ) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: verificationCode,
      );

      await _auth.signInWithCredential(credential);
    } catch (error) {
      handleAuthError(error);
    }
  }



  Future<void> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Registration successful, navigate to login page
      Get.offAll(MyProfile()); // Make sure to import the login page
    } catch (error) {
      handleAuthError(error);
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Sign-in successful, you can perform any necessary actions here
      // For example, you can navigate to the home page
      Get.offAll(HomePage()); // Import your home page and navigate to it
    } catch (error) {
      handleAuthError(error);
    }
  }

  void handleAuthError(error) {
    // Handle Firebase authentication errors
    print('Authentication error: $error');
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'wrong-password':
          Get.snackbar('Invalid password', 'Please try again');
          break;
        case 'user-not-found':
          Get.snackbar('Email not Registered', 'No user found with this email');
          break;
        case 'user-disabled':
          Get.snackbar('Error', 'This user account has been disabled');
          break;
        case 'email-already-in-use': // Handle email already in use error
          Get.snackbar('Email already taken', 'Try again with a different email');
          break;
        default:
          Get.snackbar('Authentication failed', 'Please try again');
          break;
      }
    } else {
      // Display a generic error message for non-Firebase errors
      Get.snackbar('Authentication failed', 'Please try again');
    }
  }

  bool validateInputs({required String email, required String password}) {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Try again', 'Please enter the required credentials.');
      return false;
    }
    return true;
  }
}
