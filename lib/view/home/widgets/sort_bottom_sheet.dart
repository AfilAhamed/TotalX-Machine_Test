import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../controller/user_controller.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<UserController>(
        builder: (context, userProvider, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  'Sort',
                  style: GoogleFonts.montserrat(
                      fontSize: 19,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              RadioListTile<int>(
                title: Text(
                  'All',
                  style: GoogleFonts.montserrat(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                value: 1,
                groupValue: userProvider.selectedValue,
                onChanged: (value) {
                  userProvider.sortUser(value !);
                },
              ),
              RadioListTile<int>(
                title: Text(
                  'Age: Elder',
                  style: GoogleFonts.montserrat(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                value: 2,
                groupValue: userProvider.selectedValue,
                onChanged: (value) {
                  userProvider.sortUser(value !);
                },
              ),
              RadioListTile<int>(
                title: Text(
                  'Age: Younger',
                  style: GoogleFonts.montserrat(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                value: 3,
                groupValue: userProvider.selectedValue,
                onChanged: (value) {
                  userProvider.sortUser(value !);
                },
              ),
              const SizedBox(
                height: 5,
              )
            ],
          );
        },
      ),
    );
  }
}
