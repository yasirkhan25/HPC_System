import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppUser extends ChangeNotifier {
  String? appUserId;
  String? customerId;
  String? firstName;
  String? profileImage;
  String? userEmail;
  String? fcmToken;
  String? user;
  String? companyName;
  String? companyAddress;
  String? phoneNumber;
  String? password;
  String? confirmPassword;
  bool? isFirstLogin;
  bool? isGmailLogin;
  String? isNotificationRead;
  String? isUserNotificationRead;
  String? createdAt;
  String? bio;
  String? description;
  String? resume;
  String? resumeName;
  String? stripeAccountId;
  String? stripeAccountLink;
  String? currency;
  String? country;
  String? state;
  String? city;
  DateTime? DOB;
  String? postalCode;
  String? gender;
  String? ssnLast4;
  int? stripeAccountLinkExpiresAt;
  bool? stripeOnBoardingCompleted;
  bool isUserDetailsCompleted = false;

  AppUser({
    this.appUserId,
    this.customerId,
    this.profileImage,
    this.userEmail,
    this.fcmToken,
    this.user,
    this.companyName,
    this.companyAddress,
    this.firstName,
    this.resume,
    this.bio,
    this.description,
    this.resumeName,
    this.phoneNumber,
    this.password,
    this.confirmPassword,
    this.isFirstLogin,
    this.isGmailLogin,
    this.isNotificationRead,
    this.isUserNotificationRead,
    this.createdAt,
    this.stripeAccountId,
    this.stripeAccountLink,
    this.country,
    this.currency,
    this.state,
    this.city,
    this.DOB,
    this.gender,
    this.postalCode,
    this.ssnLast4,
    this.stripeAccountLinkExpiresAt,
    this.stripeOnBoardingCompleted,
    this.isUserDetailsCompleted = false,
  });

  AppUser.fromJson(json, id) {
    this.appUserId = id;
    try {
      this.customerId = json['customerId'] ?? null;
    } catch (e) {}

    this.resumeName = json['resumeName'];
    this.profileImage = json['profileImage'];
    this.bio = json['bio'];
    this.description = json['description'];
    this.resume = json['resume'];
    this.firstName = json['firstName'] ?? '';
    this.userEmail = json['userEmail'];
    this.fcmToken = json['fcmToken'];
    this.user = json['user'];
    this.companyName = json['companyName'];
    this.companyAddress = json['companyAddress'];
    this.phoneNumber = json['phoneNumber'] ?? '';
    this.isFirstLogin = json['isFirstLogin'];
    this.isGmailLogin = json['isGmailLogin'];
    this.isNotificationRead = json['isNotificationRead'];
    this.isUserNotificationRead = json['isUserNotificationRead'];
    this.createdAt = json['createdAt'];

    this.stripeAccountId = json['stripeAccountId'] ?? null;

    this.stripeAccountLink = json['stripeAccountLink'] ?? null;
    this.stripeAccountLinkExpiresAt =
        json['stripeAccountLinkExpiresAt'] ?? null;
    this.stripeOnBoardingCompleted = json['stripeOnBoardingCompleted'] ?? false;
    this.isUserDetailsCompleted = json['isUserDetailsCompleted'] ?? false;
    this.currency = json['currency'] ?? null;
    this.country = json['country'] ?? null;
    this.state = json['state'] ?? null;
    this.city = json['city'] ?? null;
    print("hereeeeee 1 ${json['DOB']}");
    this.DOB = json['DOB'] != null ? json['DOB'].toDate() : null;
    this.postalCode = json['postalCode'] ?? null;
    this.gender = json['gender'] ?? null;
    this.ssnLast4 = json['ssnLast4'] ?? null;
  }
  toJson() {
    return {
      'resumeName': this.resumeName,
      'customerId': this.customerId,
      'appUserId': this.appUserId,
      'profileImage': this.profileImage,
      'firstName': this.firstName,
      'resume': this.resume,
      'bio': this.bio,
      'description': this.description,
      'userEmail': this.userEmail,
      'fcmToken': this.fcmToken,
      'user': this.user,
      'companyName': this.companyName,
      'companyAddress': this.companyAddress,
      'phoneNumber': this.phoneNumber,
      'isFirstLogin': this.isFirstLogin,
      'isGmailLogin': this.isGmailLogin,
      'isNotificationRead': this.isNotificationRead,
      'isUserNotificationRead': this.isUserNotificationRead,
      'createdAt': this.createdAt,
      'stripeAccountId': this.stripeAccountId ?? null,
      'stripeAccountLink': this.stripeAccountLink ?? null,
      'stripeAccountLinkExpiresAt': this.stripeAccountLinkExpiresAt ?? null,
      'stripeOnBoardingCompleted': this.stripeOnBoardingCompleted ?? false,
      'isUserDetailsCompleted': this.isUserDetailsCompleted,
      'currency': this.currency,
      'country': this.country,
      'state': this.state,
      'city': this.city,
      'DOB': this.DOB,
      'postalCode': this.postalCode,
      'gender': this.gender,
      'ssnLast4': this.ssnLast4,
    };
  }
}
