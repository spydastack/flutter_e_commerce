import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';
import '../../../controllers/auth_controller.dart';
import '../../../routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authController = AuthController();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              onTap: logInUser,
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
                          "Login",
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
                const Text("Need an account?"),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      register,
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 8),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed(resetPassword),
                  child: const Text(
                    "Forgot password?",
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
    );
  }

  void logInUser() async {
    setState(() {
      isLoading = true;
    });
    try {
      bool res = await _authController.signInWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );
      if (!res) {
        showSnackBar(context, "Error logging in");
      } else {
        _emailController.clear();
        _passwordController.clear();
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
}
