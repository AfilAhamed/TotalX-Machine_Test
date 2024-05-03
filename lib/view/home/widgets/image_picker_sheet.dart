import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_application/controller/user_controller.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  const ImagePickerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: mq.height * .03, bottom: mq.height * .05),
      children: [
        const Text(
          'Pick a Profile Picture',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: mq.height * .02),
        Consumer<UserController>(
          builder: (context, userProvider, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        fixedSize: Size(mq.width * .3, mq.height * .15)),
                    onPressed: () async {
                      await userProvider
                          .pickUserPrfoile(ImageSource.gallery)
                          .then((value) => Navigator.pop(context));
                    },
                    child: Image.asset('assets/images/gallery.png')),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        fixedSize: Size(mq.width * .3, mq.height * .15)),
                    onPressed: () {
                      userProvider
                          .pickUserPrfoile(ImageSource.camera)
                          .then((value) => Navigator.pop(context));
                    },
                    child: Image.asset('assets/images/camera.png')),
              ],
            );
          },
        )
      ],
    );
  }
}
