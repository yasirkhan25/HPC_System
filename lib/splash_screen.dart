import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hangu_pesco_complaints_system/admin_screens/admin_home.dart';
import 'package:hangu_pesco_complaints_system/user_screens/authentication/signin_screen/signin_screen.dart';
import 'package:hangu_pesco_complaints_system/user_screens/authentication/signup_screen/phone_auth.dart';
import 'package:hangu_pesco_complaints_system/user_screens/user_home/user_home.dart';
import 'core/color/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splashScreenDelay();
    super.initState();
  }

  splashScreenDelay() async {
    await Future.delayed(const Duration(seconds: 3));

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                user.phoneNumber == "+923100995210" ? AdminHome() : UserHome()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => PhoneAuthScreen()),
      );
    }

    // if (user != null) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => user.email == "admin@gmail.com"? AdminHome():UserHome()),
    //   );
    // } else {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => SigninScreen()),
    //   );
    // }
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
}
