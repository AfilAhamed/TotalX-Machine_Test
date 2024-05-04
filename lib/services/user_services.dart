import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../model/user_model.dart';

class UserServices {
  final CollectionReference firestore =
      FirebaseFirestore.instance.collection('Users');
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final firebaseAuth = FirebaseAuth.instance;

  //add users to firestore
  void addUsers(UserModel user) {
    final data = user.toMap();
    firestore.add(data);
  }

  //get users from firestore
  Future<List<UserModel>> getUsers() async {
    final data = await firestore.orderBy('name').get();
    return data.docs
        .map((value) => UserModel.fromMap(value.data() as Map<String, dynamic>))
        .toList();
  }

  // add image to firebase storage and return
  Future<String> getUserProfilePicture(File file) async {
    String fileName = DateTime.now().microsecondsSinceEpoch.toString();
    final ref = firebaseStorage.ref().child('profile_images/$fileName');
    await ref.putFile(File(file.path));
    return await ref.getDownloadURL();
  }
}
