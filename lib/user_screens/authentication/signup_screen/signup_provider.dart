import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/enums/view_state.dart';
import '../../../core/models/base_view_model.dart';
import '../../user_home/user_home.dart';

class SignUpProvider extends BaseViewModal {
  final authInstant = FirebaseAuth.instance;
  bool isVisiblePassword = true;
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  visiblePassword() async {
    print("Password state : $isVisiblePassword");
    isVisiblePassword = await !isVisiblePassword;
    notifyListeners();
    print("Password final state : $isVisiblePassword");
  }

  signUpUser(String name, String email, String password, BuildContext context) async {
    setState(ViewState.busy);

    print("User name: ${name}");
    print("User email: ${email}");
    print("User password: ${password}");
    setState(ViewState.busy);
    try {
      final credential = await authInstant.createUserWithEmailAndPassword(
          email: email, password: password);

      /// Save user information to SharedPreferences
      await saveUserInfoToSharedPreferences(credential.user!.uid, name, email);

      setState(ViewState.idle);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => UserHome()));
    } catch (e) {
      setState(ViewState.idle);
      String errorMessage = "An error occurred. Please try again.";

      if (e is FirebaseAuthException) {
        setState(ViewState.idle);
        switch (e.code) {
          case 'email-already-in-use':
            errorMessage = "Email is already in use. Please use a different email.";
            break;
          case 'weak-password':
            errorMessage = "Weak password. Please use a stronger password.";
            break;
        }
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  /// Save user information to SharedPreferences
  saveUserInfoToSharedPreferences(String userID, String name, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userID', userID);
    prefs.setString('name', name);
    prefs.setString('email', email);
  }
}
