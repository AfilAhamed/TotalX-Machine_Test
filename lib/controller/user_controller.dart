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
  final TextEditingController searchController = TextEditingController();

  String imagePath = "";
  List<UserModel> usersList = [];
  List<UserModel> filterUsersList = [];

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

  // search Functionality
  void search(String search) {
    filterUsersList.clear(); // Clear previous search results

    filterUsersList.addAll(usersList.where((user) =>
        user.name.toLowerCase().contains(search.toLowerCase()) ||
        user.age
            .toString()
            .toLowerCase()
            .contains(search.toLowerCase()))); // Filter users by name or age
    notifyListeners();
  }
}
