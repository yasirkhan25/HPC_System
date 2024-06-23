import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hangu_pesco_complaints_system/admin_screens/admin_home.dart';
import 'package:hangu_pesco_complaints_system/splash_screen.dart';
import 'package:hangu_pesco_complaints_system/user_screens/complaint_screens/complaints_provider.dart';
import 'package:provider/provider.dart';
import 'admin_screens/all_complaints_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ComplaintProvider(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => AllComplaintProvider(),
          lazy: true,
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
            labelMedium: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(31, 79, 143, 1.0),
            ),
            titleLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
