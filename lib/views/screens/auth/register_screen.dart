import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../const.dart';
import '../../../routes.dart';
import 'package:ecommerce_app/controllers/auth_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController _authController = AuthController();

  late TextEditingController _fullNameController;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool isLoading = false;

  Uint8List? _imagePicked;

  dynamic pickImageError;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameController;
    _usernameController;
    _emailController;
    _passwordController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  _imagePicked != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.grey,
                          backgroundImage: MemoryImage(_imagePicked!),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png",
                          ),
                        ),
                  Positioned(
                    child: GestureDetector(
                      onTap: selectImage,
                      child: const Icon(Icons.add_a_photo),
                    ),
                    bottom: 10,
                    right: 5,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Full name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Username',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: createUser,
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: buttonColor,
                  ),
                  child: Center(
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: buttonTextColor,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(login, (route) => false);
                    },
                    child: const Text(
                      "Login up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createUser() async {
    setState(() {
      isLoading = true;
    });
    try {
      bool res = await _authController.createUserWithEmailAndPassword(
        _fullNameController.text,
        _usernameController.text,
        _emailController.text,
        _passwordController.text,
        _imagePicked,
      );
      if (!res) {
        showSnackBar(context, "Error saving user");
      } else {
        _fullNameController.clear();
        _usernameController.clear();
        _emailController.clear();
        _passwordController.clear();
        _imagePicked = null;
        Navigator.of(context).pushNamedAndRemoveUntil(
          mainNavbar,
          (route) => false,
        );
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void selectImage() async {
    try {
      Uint8List pickedFile =
          await _authController.pickImage(ImageSource.gallery);
      setState(() {
        _imagePicked = pickedFile;
      });
    } catch (e) {
      setState(() {
        pickImageError = e;
      });
    }
  }
}
