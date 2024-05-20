import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ComplaintModel extends ChangeNotifier {
  String? complaintID;
  String? userID;
  String? userName;
  String? userEmail;
  String? fcmToken;
  String? profileImage;
  String? complaintImage;
  String? complaintTitle;
  String? complaintLocation;
  String? complaintDescription;
  String? userPhoneNo;
  String? complaintReferenceNo;
  String? complaintStatus;
  String? createdAt;

  ComplaintModel({
    this.complaintID,
    this.userID,
    this.userName,
    this.userEmail,
    this.fcmToken,
    this.profileImage,
    this.complaintImage,
    this.complaintTitle,
    this.complaintLocation,
    this.complaintDescription,
    this.userPhoneNo,
    this.complaintReferenceNo,
    this.complaintStatus,
    this.createdAt,
  });

  ComplaintModel.fromJson(json) {
    this.complaintID = json['complaintID'];
    this.userID = json['userID'];
    this.userName = json['userName'];
    this.userEmail = json['userEmail'];
    this.fcmToken = json['fcmToken'];
    this.profileImage = json['profileImage'];
    this.complaintImage = json['complaintImage'];
    this.complaintTitle = json['complaintTitle'];
    this.complaintLocation = json['complaintLocation'];
    this.complaintDescription = json['complaintDescription'];
    this.userPhoneNo = json['userPhoneNo'];
    this.complaintReferenceNo = json['complaintReferenceNo'];
    this.complaintStatus = json['complaintStatus'];
    this.createdAt = json['createdAt'];
  }
  toJson() {
    return {
      'complaintID': this.complaintID,
      'userID': this.userID,
      'userName': this.userName,
      'userEmail': this.userEmail,
      'fcmToken': this.fcmToken,
      'profileImage': this.profileImage,
      'complaintImage': this.complaintImage,
      'complaintTitle': this.complaintTitle,
      'complaintLocation': this.complaintLocation,
      'complaintDescription': this.complaintDescription,
      'userPhoneNo': this.userPhoneNo,
      'complaintReferenceNo': this.complaintReferenceNo,
      'complaintStatus': this.complaintStatus,
      'createdAt': this.createdAt,
    };
  }
}
