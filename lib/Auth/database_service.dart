import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService {

  Future<String> addUser({
    required String email,
    required String name,
    required int number,
    required String password,
  }) async {
    try {
      CollectionReference users =
      FirebaseFirestore.instance.collection('users');
      // Call the user's CollectionReference to add a new user
      await users.doc(email).set({
        'full_name': name,
        'phone_num': number,
        'password': password,
      });
      print('success');

      return _registerUser(email: email, password: password);
    } catch (e) {
      return 'Error adding user';
    }
  }

  Future<String> verifyCredentials(
      {required String email, required String password}) async {
    String msg = '';

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
        );
        msg = 'success';
      } on FirebaseAuthException catch (e) {
        if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          msg = 'Invalid login credentials.';
        } else {
          msg = e.code;
        }
      }
    } else {
      msg = 'Please fill out both fields!';
    }
    return msg;
  }

  Future<String> _registerUser(
      {required String email, required String password}) async {
    String msg = '';
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      msg = 'success';
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase errors
      if (e.code == 'weak-password') {
        msg = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        msg = 'The email is already in use.';
      } else if (e.code == 'invalid-email') {
        msg = 'The email address is invalid.';
      } else {
        msg = 'An unexpected error occurred: ${e.message}';
      }
    }

    return msg;
  }

  Future<String> getUserFullName(String email) async {
    try {
      CollectionReference users =
      FirebaseFirestore.instance.collection('users');
      final snapshot = await users.doc(email).get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data['full_name'];
    } catch (e) {
      return 'Error fetching user';
    }
  }

  Future<Map<String, dynamic>?> getUser(String email) async {
    try {
      CollectionReference users =
      FirebaseFirestore.instance.collection('users');
      final snapshot = await users.doc(email).get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data;
    } catch (e) {
      return null;
    }
  }
}
