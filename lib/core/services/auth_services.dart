// import 'package:firebase_auth/firebase_auth.dart';
// import '../models/app_user.dart';
// import 'auth_exception_message.dart';
// import 'custom_auth_result.dart';
// import 'database_services.dart';
//
class AuthServices {
//   final databaseServices = DatabaseServices();
//   final customAuthResult = CustomAuthResult();
//   final authInstant = FirebaseAuth.instance;
//   bool? isLogin;
//   User? user;
//   AppUser appUser = AppUser();
//
//   AuthServices() {
//     // init();
//   }

  // init() async {
  //   user = authInstant.currentUser;
  //   if (user != null) {
  //     print('userrrrrrrrrr=======' + user!.uid.toString());
  //     isLogin = true;
  //     print("appuser=====>" + appUser.toString());
  //     this.appUser = await databaseServices.getUser(user!.uid);
  //     print('userId => ${this.appUser.appUserId}');
  //   } else {
  //     isLogin = false;
  //   }
  // }

  // Future<CustomAuthResult> signUpUser(AppUser appUser, User user) async {
  //   try {
  //     if (user != null) {
  //       print('user registered');
  //       this.appUser = appUser;
  //       this.appUser.appUserId = user.uid;
  //       this.isLogin = true;
  //       print("SignUpUserId=> ${this.appUser.appUserId}");
  //       await databaseServices.registerUser(appUser);
  //       this.appUser = await databaseServices.getUser(user.uid);
  //       customAuthResult.user = user;
  //     }
  //   } catch (e) {
  //     print('Exception@signUpUser $e');
  //     customAuthResult.errorMessage =
  //         AuthExceptionsMessages.generateExceptionMessage(e);
  //   }
  //   return customAuthResult;
  // }
  // Future<CustomAuthResult> signInUser(AppUser appUser, User user) async {
  //   try {
  //     if (user != null) {
  //       print('user registered');
  //       this.appUser = appUser;
  //       this.appUser.appUserId = user.uid;
  //       this.isLogin = true;
  //       this.appUser = await databaseServices.getUser(user.uid);
  //       customAuthResult.user = user;
  //     }
  //   } catch (e) {
  //     print('Exception@signUpUser $e');
  //     customAuthResult.errorMessage =
  //         AuthExceptionsMessages.generateExceptionMessage(e);
  //   }
  //   return customAuthResult;
  // }

  // ///
  // /// Login user
  // ///
  // Future<CustomAuthResult> loginUser(AppUser appUser, User user) async {
  //   try {
  //     print("User logined successfully");
  //     if (user != null) {
  //       customAuthResult.user = user;
  //       this.appUser = appUser;
  //       this.appUser.appUserId = user.uid;
  //       this.isLogin = true;
  //
  //       ///
  //       /// Get user
  //       ///
  //       this.appUser = await databaseServices.getUser(user.uid);
  //       //this.appUser.fcmToken = await FirebaseMessaging.instance.getToken();
  //       await databaseServices.updateUserProfile(this.appUser);
  //     }
  //   } catch (e) {
  //     print('Exception@LoginUser $e');
  //     customAuthResult.errorMessage =
  //         AuthExceptionsMessages.generateExceptionMessage(e);
  //   }
  //   return customAuthResult;
  // }

//   /// Logout user
//   ///
//   Future<void> logoutUser() async {
//     await authInstant.signOut();
//
//     this.isLogin = false;
//     this.appUser = AppUser();
//     this.user = null;
//
//     if (authInstant.currentUser == null) {
//     } else {
//       print("Logout failed. User is still authenticated.");
//     }
//   }
//
}
