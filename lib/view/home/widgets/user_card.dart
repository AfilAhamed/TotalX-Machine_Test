import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 1.5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 1,
        color: Colors.white,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: Image.network(
              "https://firebasestorage.googleapis.com/v0/b/chat-app-3f578.appspot.com/o/Profile_Pictures%2FgvPxnV6cLCXAZTGllQV2xOOR2yv2.jpg?alt=media&token=47611d29-1626-4575-ac0c-7f85c49e5389",
              fit: BoxFit.cover,
            ).image,
          ),
          title: Text(
            'Afil Ahamed',
            style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mq.height * 0.007,
              ),
              Text(
                'Age: 34',
                style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
