import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  final fireStore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();

  Future<bool> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('All fields are required');
    }
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('Wrong login credentials.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong login credentials.');
      }
    }
    return false;
  }

  Future<bool> createUserWithEmailAndPassword(
    String fullName,
    String username,
    String email,
    String password,
    Uint8List? image,
  ) async {
    try {
      if (fullName.isEmpty ||
          username.isEmpty ||
          email.isEmpty ||
          password.isEmpty ||
          image == null) {
        throw Exception('All fields are required');
      }
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String? imageUrl = await _uploadUserImage(image);

      if (imageUrl == null) {
        throw Exception('Image upload failed');
      }

      await fireStore
          .collection('users')
          .doc(userCred.user!.uid)
          .set(
            {
              'fullName': fullName,
              'username': username,
              'email': email,
              'profileImage': imageUrl,
            },
          )
          .then((value) => print("User Added"))
          .catchError(
            (error) => throw Exception("Failed to add user: $error"),
          );

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return false;
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }

  // upload user image
  Future<String?> _uploadUserImage(Uint8List? image) async {
    // Create a storage reference from our app

    if (image != null) {
      Reference profileRef =
          storage.ref().child("profilePics").child(getCurrentUser()!.uid);
      try {
        // Upload raw data.
        SettableMetadata metadata = SettableMetadata(
          contentType: 'image/jpeg',
        );
        TaskSnapshot uploadTask = await profileRef.putData(image, metadata);
        String downloadUrl = await uploadTask.ref.getDownloadURL();
        return downloadUrl;
      } on FirebaseException catch (e) {
        throw Exception(e.toString());
      }
    }
    return null;
  }

  Future<void> resetPassword(String email) async {
    return await _auth.sendPasswordResetEmail(email: email);
  }

  // picking user image
  pickImage(ImageSource source) async {
    // source can either be camera or gallery e.g. ImageSource.camera, ImageSource.gallery
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      return await image.readAsBytes();
    } else {
      return null;
    }
  }
}

showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 4),
    ),
  );
}
