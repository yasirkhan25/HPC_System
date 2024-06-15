import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../admin_screens/admin_home.dart';
import '../../../core/enums/view_state.dart';
import '../../../core/models/base_view_model.dart';
import '../../user_home/user_home.dart';

class SignUpProvider extends BaseViewModal {
  final authInstant = FirebaseAuth.instance;
  bool isVisiblePassword = true;
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  // final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  visiblePassword() async {
    print("Password state : $isVisiblePassword");
    isVisiblePassword = await !isVisiblePassword;
    notifyListeners();
    print("Password final state : $isVisiblePassword");
  }

  // signUpUser(String name, String email, String password, BuildContext context) async {
  //   setState(ViewState.busy);
  //
  //   print("User name: ${name}");
  //   print("User email: ${email}");
  //   print("User password: ${password}");
  //   setState(ViewState.busy);
  //   try {
  //     final credential = await authInstant.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //
  //     /// Save user information to SharedPreferences
  //     await saveUserInfoToSharedPreferences(credential.user!.uid, name);
  //
  //     setState(ViewState.idle);
  //
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => UserHome()));
  //   } catch (e) {
  //     setState(ViewState.idle);
  //     String errorMessage = "An error occurred. Please try again.";
  //
  //     if (e is FirebaseAuthException) {
  //       setState(ViewState.idle);
  //       switch (e.code) {
  //         case 'email-already-in-use':
  //           errorMessage = "Email is already in use. Please use a different email.";
  //           break;
  //         case 'weak-password':
  //           errorMessage = "Weak password. Please use a stronger password.";
  //           break;
  //       }
  //     }
  //
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(errorMessage),
  //         duration: Duration(seconds: 2),
  //       ),
  //     );
  //   }
  // }

  // /// Save user information to SharedPreferences
  // saveUserInfoToSharedPreferences(String userID, String name, String email) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('userID', userID);
  //   prefs.setString('name', name);
  //   prefs.setString('email', email);
  // }

  final phoneController = TextEditingController(text: '+92');
  final otpController = TextEditingController();

  String? verificationId;
  bool otpSent = false;
  bool isLoading = false;

  @override
  void dispose() {
    phoneController.dispose();
    otpController.dispose();
    super.dispose();
  }

  sendOTP(BuildContext context, phoneNumber) async {
    setState(ViewState.busy);

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        await handleUserLogin(context, phoneNumber);
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(ViewState.idle);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "Verification failed")),
        );
      },
      codeSent: (String verId, int? resendToken) {
        setState(ViewState.idle);

        verificationId = verId;
        otpSent = true;
        notifyListeners();
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
        notifyListeners();
      },
    );
  }

  verifyOTP(BuildContext context, phoneNumber) async {
    setState(ViewState.busy);

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId!,
      smsCode: otpController.text,
    );

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        await handleUserLogin(context, phoneNumber);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to verify OTP")),
      );
    }
    setState(ViewState.idle);

    notifyListeners();
  }

  handleUserLogin(BuildContext context, phoneNumber) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!userDoc.exists) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'phoneNumber': user.phoneNumber,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Phone number verified successfully")),
      );
      await saveUserInfoToSharedPreferences(
          user.uid, nameController.text, user.phoneNumber);

      setState(ViewState.idle);
      print(":::::::::::>>>>${user.phoneNumber}");
      Get.off(user.phoneNumber == "+923100995210" &&
              user.phoneNumber == "+923341965302"
          ? AdminHome()
          : UserHome());
    }
  }

  Future<void> saveUserInfoToSharedPreferences(
      String userId, String? phoneNumber, String? userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
    await prefs.setString('userName', userName ?? '');
    await prefs.setString('phoneNumber', phoneNumber ?? '');
  }
}
