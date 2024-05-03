import 'package:flutter/material.dart';
import '../services/auth_services.dart';

class AuthController extends ChangeNotifier {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  //login using phone number
  void loginWithPhoneNumber(BuildContext context) {
    String phoneNumber = numberController.text.trim();

    if (!phoneNumber.startsWith("+91")) {
      phoneNumber = "+91$phoneNumber";
    }
    AuthServices().loginWithPhoneNumber(context, phoneNumber);
    notifyListeners();
  }

  //otp submition
  Future<void> otpSubmit(String verificationId) async {
    await AuthServices().otpSubmit(otpController.text, verificationId);
    notifyListeners();
  }

   // signOut from the app
  Future<void> signOut() async {
    await AuthServices().signOutUser();
  }
}
