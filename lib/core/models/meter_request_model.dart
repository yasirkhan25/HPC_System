import 'package:flutter/material.dart';

class MeterRequestModel extends ChangeNotifier {
  String? meterID;
  String? userID;
  String? userName;
  String? userEmail;
  String? meterTitle;
  String? meterLocation;
  String? meterDescription;
  String? userPhoneNo;
  String? meterNo;
  String? meterStatus;
  String? createdAt;
  String? meterPaymentImage;


  MeterRequestModel({
    this.meterID,
    this.userID,
    this.userName,
    this.userEmail,
    this.meterTitle,
    this.meterLocation,
    this.meterDescription,
    this.userPhoneNo,
    this.meterNo,
    this.meterStatus,
    this.createdAt,
    this.meterPaymentImage,
  });

  MeterRequestModel.fromJson(json) {
    this.meterID = json['meterID'];
    this.userID = json['userID'];
    this.userName = json['userName'];
    this.userEmail = json['userEmail'];
    this.meterTitle = json['meterTitle'];
    this.meterLocation = json['meterLocation'];
    this.meterDescription = json['meterDescription'];
    this.userPhoneNo = json['userPhoneNo'];
    this.meterNo = json['meterNo'];
    this.meterStatus = json['meterStatus'];
    this.createdAt = json['createdAt'];
    this.meterPaymentImage = json['meterPaymentImage'];
  }

  Map<String, dynamic> toJson() {
    return {
      'meterID': this.meterID,
      'userID': this.userID,
      'userName': this.userName,
      'userEmail': this.userEmail,
      'meterTitle': this.meterTitle,
      'meterLocation': this.meterLocation,
      'meterDescription': this.meterDescription,
      'userPhoneNo': this.userPhoneNo,
      'meterNo': this.meterNo,
      'meterStatus': this.meterStatus,
      'createdAt': this.createdAt,
      'meterPaymentImage': this.meterPaymentImage,
    };
  }
}
