import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../model/user_model.dart';
import '../services/user_services.dart';

class UserController extends ChangeNotifier {
  UserController() {
    getUsers();
    getAllUsers();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getMoreUsers(); // lazy loading funtionality
      }
    });
  }
  UserServices userServices = UserServices();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  String imagePath = "";
  List<UserModel> usersList = []; // list for lazy loading
  List<UserModel> filterUsersList = []; // list for sort and search
  List<UserModel> allUsersList = []; // list for storeing all users

  int selectedValue = 1;
  bool isSorting = false;
  var lastDocs;

  // add users
  void addUsers() async {
    final name = nameController.text.trim();
    final age = ageController.text.trim();

    final image = await userServices.getUserProfilePicture(File(imagePath));
    final userData = UserModel(name: name, age: int.parse(age), image: image);
    userServices.addUsers(userData);
    getUsers();
    getAllUsers();
    notifyListeners();
  }

  //get inital users for lazy loading
  Future<void> getUsers() async {
    final data = await userServices.getUsers();
    lastDocs = data.last as QueryDocumentSnapshot<Object>?; // last document
    usersList = data
        .map((value) => UserModel.fromMap(value.data() as Map<String, dynamic>))
        .toList();
    notifyListeners();
  }

  // get all users from firestore
  Future<void> getAllUsers() async {
    allUsersList.clear();
    allUsersList.addAll(await userServices.getAllUsers());
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
    isSorting = false;
    filterUsersList.addAll(allUsersList.where((user) =>
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
      isSorting = false;
    } else if (selectedValue == 2) {
      isSorting = true;
      filterUsersList =
          allUsersList.where((item) => item.age >= 60).toList(); // Elder
    } else if (selectedValue == 3) {
      isSorting = true;
      filterUsersList =
          allUsersList.where((item) => item.age < 60).toList(); //Younger
    }
    notifyListeners();
  }

  //load more users when scrolling
  Future<void> getMoreUsers() async {
    final data = await userServices.getMoreUsers(lastDocs);

    lastDocs = data.last as QueryDocumentSnapshot<Object>?;
    await Future.delayed(
        const Duration(seconds: 1)); // Simulating delay for demonstration

    usersList.addAll(data
        .map((value) => UserModel.fromMap(value.data() as Map<String, dynamic>))
        .toList());
    notifyListeners();
  }
}
