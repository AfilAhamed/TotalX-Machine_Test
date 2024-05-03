import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_application/controller/auth_controller.dart';

class OtpScreen extends StatelessWidget {
  final String phoneNumber;
  final String verificationId;
  const OtpScreen(
      {super.key, required this.phoneNumber, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    //  final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Consumer<AuthController>(
            builder: (context, authProvider, child) {
              return Column(
                children: [
                  Center(
                      child: Image.asset(
                    'assets/images/otp_screen_image.png',
                    height: mq.height * 0.2,
                    width: mq.width * 0.4,
                    fit: BoxFit.contain,
                  )),
                  SizedBox(
                    height: mq.height * 0.040,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'OTP Verification',
                        style: GoogleFonts.montserrat(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    height: mq.height * 0.030,
                  ),
                  Text(
                    'Enter the verification code we just sent to your number +91 ********21.',
                    style: GoogleFonts.montserrat(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: mq.height * 0.035,
                  ),
                  Pinput(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the otp';
                      } else {
                        return null;
                      }
                    },
                    controller: authProvider.otpController,
                    length: 6,
                    defaultPinTheme: PinTheme(
                        width: 55,
                        height: 55,
                        textStyle:
                            const TextStyle(fontSize: 22, color: Colors.red),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey, width: 1))),
                    focusedPinTheme: PinTheme(
                        width: 55,
                        height: 55,
                        textStyle:
                            const TextStyle(fontSize: 22, color: Colors.red),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black))),
                  ),
                  SizedBox(
                    height: mq.height * 0.020,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '59 Sec',
                      style: GoogleFonts.montserrat(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.025,
                  ),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      children: [
                        const TextSpan(text: 'Don\'t Get OTP? '),
                        TextSpan(
                            text: 'Resend',
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w700,
                              decorationThickness: 2,
                              decoration: TextDecoration.underline,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.025,
                  ),
                  SizedBox(
                      height: mq.height * 0.063,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.black)),
                          onPressed: () {
                            //if (formKey.currentState!.validate()) {
                            authProvider.otpSubmit(verificationId);
                            //   }
                          },
                          child: Text(
                            'Verify',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
