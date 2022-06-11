import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';
import '../../../controllers/auth_controller.dart';
import '../../../routes.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final AuthController _authController = AuthController();
  late TextEditingController _emailController;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reset Password',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your registered email',
              style: TextStyle(fontSize: 16),
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
            InkWell(
              onTap: resetPassword,
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
                          "Send reset link",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: buttonTextColor,
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Check span in your email",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  void resetPassword() async {
    setState(() {
      isLoading = true;
    });
    if (_emailController.text.isEmpty) {
      showSnackBar(context, "Please enter your email");
      setState(() {
        isLoading = false;
      });
      return;
    }
    try {
      await _authController.resetPassword(_emailController.text);
      showSnackBar(context, "Check you email");
    } catch (e) {
      showSnackBar(context, e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
