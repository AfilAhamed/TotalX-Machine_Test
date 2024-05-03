import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../model/user_model.dart';
import '../services/user_services.dart';

class UserController extends ChangeNotifier {
  UserController() {
    getAllUsers();
  }
  UserServices userServices = UserServices();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String imagePath = "";
  List<UserModel> usersList = [];

  // add users
  void addUsers() async {
    final name = nameController.text.trim();
    final age = ageController.text.trim();

    final image = await userServices.getUserProfilePicture(File(imagePath));
    final userData = UserModel(name: name, age: int.parse(age), image: image);
    userServices.addUsers(userData);
    getAllUsers();
    notifyListeners();
  }

  //get all users
  Future<void> getAllUsers() async {
    usersList = await userServices.getUsers();
    notifyListeners();
  }

  //set user profile picture
  Future<void> pickUserPrfoile(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      imagePath = image.path;
    }
    notifyListeners();
  }
}
