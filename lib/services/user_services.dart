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

  //get initial limited users from firestore for LazyLoading
  Future<List<QueryDocumentSnapshot>> getUsers() async {
    final data = await firestore.orderBy('name').limit(7).get();//fetch initialy by 7 users
    return data.docs;
  }

  //get more users from firestore when scrolling
  Future<List<QueryDocumentSnapshot>> getMoreUsers(lastDocument) async {
    final data = await firestore
        .orderBy('name')
        .startAfterDocument(lastDocument)
        .limit(3) // fetch users by 3
        .get();
    return data.docs;
  }

  //get all users from firestore
  Future<List<UserModel>> getAllUsers() async {
    final data = await firestore.orderBy('name').get();

    final allData = data.docs
        .map((value) => UserModel.fromMap(value.data() as Map<String, dynamic>))
        .toList();
    return allData;
  }

  // add image to firebase storage and return
  Future<String> getUserProfilePicture(File file) async {
    String fileName = DateTime.now().microsecondsSinceEpoch.toString();
    final ref = firebaseStorage.ref().child('profile_images/$fileName');
    await ref.putFile(File(file.path));
    return await ref.getDownloadURL();
  }
}
