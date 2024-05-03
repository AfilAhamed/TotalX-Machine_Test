import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../view/auth/otp_screen.dart';

class AuthServices {
  final firebaseAuth = FirebaseAuth.instance;

  //login to the app using phone number
  void loginWithPhoneNumber(BuildContext context, String phoneNumber) {
    try {
      firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          log(e.toString());
          throw Exception(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OtpScreen(
                        phoneNumber: phoneNumber,
                        verificationId: verificationId,
                      )));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      log('\n LogInWithPhoneNumber Failed : $e');
      throw Exception(e);
    }
  }

  //otp Submition
  Future<void> otpSubmit(String otp, String verificationId) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          smsCode: otp, verificationId: verificationId);

      final User user =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
      log(user.toString());
    } catch (e) {
      log('OTP Submition Failed${e.toString()}');
      throw Exception(e);
    }
  }


   //signOut from the app
  Future<void> signOutUser() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      log('\n signOut  Failed: $e');
    }
  }
}
