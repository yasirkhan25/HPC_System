import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hangu_pesco_complaints_system/admin_screens/admin_home.dart';
import 'package:hangu_pesco_complaints_system/user_screens/authentication/signin_screen/signin_screen.dart';
import 'package:hangu_pesco_complaints_system/user_screens/authentication/signup_screen/phone_auth.dart';
import 'package:hangu_pesco_complaints_system/user_screens/user_home/user_home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/color/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseMessaging fcm = FirebaseMessaging.instance;

  @override
  void initState() {
    splashScreenDelay();
    super.initState();
  }

  splashScreenDelay() async {
    await Future.delayed(const Duration(seconds: 3));
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // String? fcmToken = await fcm.getToken();
      // await saveUserInfoToSharedPreferences(fcmToken!);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
            user.phoneNumber == "+923341965302"||
            user.phoneNumber == "+923306542442"
                ? const AdminHome()
                : const UserHome()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => PhoneAuthScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Image.asset(
            'asset/logo.png',
            height: 150,
          ),
        ),
      ),
    );
  }

  Future<void> saveUserInfoToSharedPreferences(String fcmToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fcmToken', fcmToken ?? '');
  }
}
