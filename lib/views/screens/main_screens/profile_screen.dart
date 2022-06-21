import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/controllers/user_controller.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthController _authController = AuthController();
  final UserController _userController = UserController();
  late String? _username;
  late String? _profileImage;
  late String? _email;

  @override
  void initState() {
    _username = null;
    _profileImage = null;
    _email = null;
    getUserData();
    super.initState();
  }

  void getUserData() async {
    DocumentSnapshot userData = await _userController
        .getCurrentUserData(_authController.getCurrentUser()!.uid);
    if (userData.exists) {
      setState(() {
        _username = userData.get("username");
        _profileImage = userData.get("profileImage");
        _email = userData.get("email");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _username != null
            ? Text(
                "$_username's profile",
                style: const TextStyle(color: Colors.black),
              )
            : null,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          _profileImage == null
              ? const CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png",
                  ),
                )
              : CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(
                    _profileImage.toString(),
                  ),
                ),
          Center(
            child: ElevatedButton(
              onPressed: () async => await _authController.signOut(),
              child: const Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }
}
