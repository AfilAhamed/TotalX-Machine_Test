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
  List<UserModel> usersList = []; // all users list
  List<UserModel> filterUsersList = [];
  int selectedValue = 1;
  bool isFetchingData = false;

  // add users
  void addUsers() async {
    final name = nameController.text.trim();
    final age = ageController.text.trim();

    final image = await userServices.getUserProfilePicture(File(imagePath));
    final userData = UserModel(name: name, age: int.parse(age), image: image);
    userServices.addUsers(userData);
    isFetchingData = !isFetchingData;
    getAllUsers();
    notifyListeners();
  }

  //get all users
  Future<void> getAllUsers() async {
    usersList = await userServices.getUsers();
    if (usersList.isNotEmpty) {
      filterUsersList.clear();
      isFetchingData = true;

      filterUsersList.addAll(usersList);
      isFetchingData = false;
    }
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
    selectedValue = 1;
    filterUsersList.addAll(usersList.where((user) =>
        user.name.toLowerCase().contains(search.toLowerCase()) ||
        user.age
            .toString()
            .toLowerCase()
            .contains(search.toLowerCase()))); // Filter users by name or age
    notifyListeners();
  }

  // sort user based on Age
  void sortUser(int value) {
    selectedValue = value;
    if (selectedValue == 1) {
      filterUsersList.clear();
      filterUsersList.addAll(usersList); //All
    } else if (selectedValue == 2) {
      filterUsersList =
          usersList.where((item) => item.age >= 60).toList(); // Elder
    } else if (selectedValue == 3) {
      filterUsersList =
          usersList.where((item) => item.age < 60).toList(); //Younger
    }
    notifyListeners();
  }
}
