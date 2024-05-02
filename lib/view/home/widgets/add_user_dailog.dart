import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddUserDailog extends StatefulWidget {
  const AddUserDailog({
    super.key,
  });

  @override
  State<AddUserDailog> createState() => _AddUserDailogState();
}

class _AddUserDailogState extends State<AddUserDailog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String imageUrl = "";
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(
          horizontal: 12, vertical: 10), 

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SizedBox(
        height: mq.height * .50,
        width: mq.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add A New User",
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: mq.height * 0.08,
                    backgroundImage: const AssetImage(""),
                  ),
                  Positioned(
                    left: mq.width * 0.01,
                    top: mq.height * 0.10,
                    child: Transform.rotate(
                      angle: 3.14 / 1,
                      child: ClipRect(
                        child: Align(
                          alignment: Alignment.topCenter,
                          heightFactor: 0.4,
                          child: CircleAvatar(
                            radius: mq.height * 0.075,
                            backgroundColor: Colors.black.withOpacity(0.1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: mq.height * 0.1,
                    left: mq.width * 0.10,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          size: 25,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Name",
                style: GoogleFonts.montserrat(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
            SizedBox(
              height: mq.height * 0.005,
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 15), 
              ),
            ),
            SizedBox(
              height: mq.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Age",
                style: GoogleFonts.montserrat(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 15), 
              ),
            ),
            SizedBox(
              height: mq.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: mq.width * .26,
                  height: mq.height * 0.046,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 206, 206, 206))),
                      onPressed: () {},
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.montserrat(
                            color: Colors.grey.shade700,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      )),
                ),
                SizedBox(
                  width: mq.width * 0.03,
                ),
                SizedBox(
                  width: mq.width * .26,
                  height: mq.height * 0.046,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue.shade600)),
                      onPressed: () {},
                      child: Text(
                        'Save',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
