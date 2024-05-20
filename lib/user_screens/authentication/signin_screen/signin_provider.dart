import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hangu_pesco_complaints_system/admin_screens/admin_home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/enums/view_state.dart';
import '../../../core/models/base_view_model.dart';
import '../../../core/services/custom_auth_result.dart';
import '../../user_home/user_home.dart';

String? userID;
String? userEmail;
class SignInProvider extends BaseViewModal {
  final authInstant = FirebaseAuth.instance;

  CustomAuthResult customAuthResult = CustomAuthResult();
  final formKey = GlobalKey<FormState>();

  bool isVisiblePassword = true;

  visiblePassword() {
    print("Password state : $isVisiblePassword");
    isVisiblePassword = !isVisiblePassword;
    notifyListeners();
    print("Password final state : $isVisiblePassword");
  }

  loginUser(String email, String password, BuildContext context) async {
    setState(ViewState.busy);

    print("App user email: ${email}");
    print("App user password: ${password}");
    setState(ViewState.busy);
    try {
      final credential = await authInstant.signInWithEmailAndPassword(
          email: email, password: password);
      userID = credential.user!.uid;
      userEmail = credential.user!.email;
      print("User ID: ${userID.toString()}");

      /// Save user ID to SharedPreferences
      await saveUserIDToSharedPreferences(userID,userEmail);

      setState(ViewState.idle);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => email == "admin@gmail.com" ? AdminHome(): UserHome()));
    } catch (e) {
      setState(ViewState.idle);
      String errorMessage = "An error occurred. Please try again.";

      if (e is FirebaseAuthException) {
        setState(ViewState.idle);

        switch (e.code) {

    case 'user-not-found':
            errorMessage = "User not found. Please check your email.";
            break;
          case 'wrong-password':
            errorMessage = "Wrong password. Please try again.";
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

  /// Save user ID to SharedPreferences
  saveUserIDToSharedPreferences(String? userID,String? userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userID', userID!);
    prefs.setString('userEmail', userEmail!);
  }
}
