import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedValue = 0; 

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
            value: 0,
            groupValue: selectedValue,
            onChanged: (value) {},
          ),
          RadioListTile<int>(
            title: Text(
              'Age: Elder',
              style: GoogleFonts.montserrat(
                  color: Colors.black, fontWeight: FontWeight.w500),
            ),
            value: 0,
            groupValue: selectedValue,
            onChanged: (value) {},
          ),
          RadioListTile<int>(
            title: Text(
              'Age: Younger',
              style: GoogleFonts.montserrat(
                  color: Colors.black, fontWeight: FontWeight.w500),
            ),
            value: 0,
            groupValue: selectedValue,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
