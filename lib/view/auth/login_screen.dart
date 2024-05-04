import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../controller/auth_controller.dart';
import '../../helpers/snackbar.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Center(
                    child: Image.asset(
                  'assets/images/login_screen_image.png',
                  height: mq.height * 0.2,
                  width: mq.width * 0.4,
                  fit: BoxFit.contain,
                )),
                SizedBox(
                  height: mq.height * 0.050,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Enter Phone Number',
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.02,
                ),
                Consumer<AuthController>(
                  builder: (context, authProvider, child) {
                    return TextFormField(
                      controller: authProvider.numberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a number';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        hintText: 'Enter Phone Number *',
                        hintStyle: GoogleFonts.montserrat(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            )),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: mq.height * 0.03,
                ),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.montserrat(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                    children: [
                      const TextSpan(
                          text: 'By Continuing, I agree to TotalX’s '),
                      TextSpan(
                        text: 'Terms and condition',
                        style: TextStyle(color: Colors.blue.shade300),
                      ),
                      const TextSpan(text: ' & '),
                      TextSpan(
                        text: 'privacy Policy',
                        style: TextStyle(color: Colors.blue.shade300),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.04,
                ),
                SizedBox(
                    height: mq.height * 0.066,
                    width: double.infinity,
                    child: Consumer<AuthController>(
                      builder: (context, authProvider, child) {
                        return ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.black)),
                            onPressed: () {
                              if (authProvider
                                  .numberController.text.length==10) {
                                authProvider.loginWithPhoneNumber(context);
                              } else if (authProvider
                                  .numberController.text.isEmpty) {
                                showSnackBar(
                                    context,
                                    'Please enter the phone number',
                                    Colors.red);
                              } else if (authProvider
                                      .numberController.text.length <10||authProvider
                                      .numberController.text.length >10
                                  ) {
                               showSnackBar(
                                    context,
                                    'Please enter a 10 digit number',
                                    Colors.red);
                              }
                            },
                            child: Text(
                              'Get OTP',
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ));
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
