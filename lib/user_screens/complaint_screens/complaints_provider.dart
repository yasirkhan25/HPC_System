import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/models/app_user.dart';
import '../../../../core/models/base_view_model.dart';
import '../../../core/services/database_services.dart';
import '../../../core/services/database_storage_services.dart';
import '../../core/enums/view_state.dart';
import '../../core/models/complaint_model.dart';
import '../../core/models/meter_request_model.dart';
import '../user_home/user_home.dart';

class ComplaintProvider extends BaseViewModal {
  final formKey = GlobalKey<FormState>();
  XFile? image;
  File? userImage;
  String? imageUrl;
  final ImagePicker imagePicker = ImagePicker();
  DatabaseStorageServices databaseStorageServices = DatabaseStorageServices();
  DatabaseServices databaseServices = DatabaseServices();
  AppUser appUser = AppUser();
  ComplaintModel complaintModel = ComplaintModel();
  MeterRequestModel meterRequestModel = MeterRequestModel();
  bool isLoading = true;
  String? userID;
  String? userEmail;
  String? userName;

  ComplaintProvider() {
    print("constructor calling");
    getUserInfo();
  }

  /// Get User Data ... >>>>
  void getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userID = prefs.getString('userID');
    userEmail = prefs.getString('userEmail');
    userName = prefs.getString('name');
    getAllComplaints("G8FRJdHWudUvOeQ9ujYbeJKblCk1");

    notifyListeners();
  }

  String selectedComplaint = 'Select Complaint Type';
  final List<String> complaintList = [
    'Select Complaint Type',
    'Damaged Meter',
    'Meter Sparking/Wire Loose',
    'Electric Fire',
    'Damage Transformer',
    'Fluctuation',
  ];

  List<ComplaintModel> complaintRequests = [];
  Stream<QuerySnapshot>? complaintStream;

  /// Get All Complaints ======>>>>
  void getAllComplaints(String? userID) async {
    isLoading = true;
    print("???????????? user id : $userID");

    complaintStream =
        await databaseServices.getUserComplaints(userID.toString());

    complaintStream!.listen((event) {
      complaintRequests = [];

      if (event.docs.isNotEmpty) {
        event.docs.forEach((element) {
          final post = ComplaintModel.fromJson(element.data());
          complaintRequests.add(post);
          isLoading = false;
          notifyListeners();

        });
      }
    });
    isLoading = false;
    notifyListeners();
  }

  /// Add Complaint Method >>>>>>>>>>>>>
  ///
  submitComplaint(BuildContext context, String complaintTitle) async {
    setState(ViewState.busy);

    print(">>>>>>>>>>>222222222");
    complaintModel.createdAt = DateTime.now().toString();
    complaintModel.complaintStatus = "pending";
    complaintModel.complaintTitle = complaintTitle;
    // complaintModel.userEmail = userEmail.toString();
    complaintModel.userID = userID.toString();
    print(">>>>>>>>>>>33333333");

    await Future.delayed(Duration(seconds: 3));
    if (_complaintImageFile != null) {
      print(">>>>>>>>>>>444444444");

      var ComplaintImageUrl =
          await databaseStorageServices.uploadComplaintImage(
              _complaintImageFile!, userID.toString());
      complaintModel.complaintImage = ComplaintImageUrl;
    }

    await databaseServices.registerComplaint(complaintModel,userID.toString());
    setState(ViewState.idle);

    Get.off(() => UserHome());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Complaint request sent successfully'),
      ),
    );
  }

  File? _complaintImageFile;
  File? get imageFile => _complaintImageFile;
  File? _paymentReceiptImageFile;
  File? get receiptImageFile => _paymentReceiptImageFile;

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _complaintImageFile = File(pickedImage.path);
      notifyListeners();
    }
  }
  Future<void> pickPaymentImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _paymentReceiptImageFile = File(pickedImage.path);
      notifyListeners();
    }
  }

  /// Date Format Method >>>>
  String dataFormate(String date) {
    DateTime inputDate = DateTime.parse(date);

    String formattedDate = DateFormat('d MMM yyyy', 'en_US').format(inputDate);
    return formattedDate;
  }



  /// Add submitMeterRequest Method >>>>>>>>>>>>>
  ///
  submitMeterRequest(BuildContext context) async {
    setState(ViewState.busy);

    print(">>>>>>>>>>>222222222");
    meterRequestModel.createdAt = DateTime.now().toString();
    meterRequestModel.meterStatus = "pending";
    meterRequestModel.meterTitle = "meter request";
    meterRequestModel.userEmail = userEmail.toString();
    meterRequestModel.userID = userID.toString();
    print(">>>>>>>>>>>33333333");

    await Future.delayed(Duration(seconds: 3));
    if (_paymentReceiptImageFile != null) {
      print(">>>>>>>>>>>444444444");

      var PaymentReceiptImageUrl =
      await databaseStorageServices.uploadComplaintImage(
          _paymentReceiptImageFile!, userID.toString());
      meterRequestModel.meterPaymentImage = PaymentReceiptImageUrl;
    }

    await databaseServices.registerMeterRequest(meterRequestModel,userID.toString());
    setState(ViewState.idle);

    Get.off(() => const UserHome());

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Meter request sent successfully'),
      ),
    );
  }

  /// Update Feedback Function ========>>>
  updateFeedbackMethod(BuildContext context, String feedback, String userId, String complaintId ) async {
    setState(ViewState.busy);
    await Future.delayed(
      const Duration(seconds: 1),);
    try {
      complaintModel.feedBack = feedback;

      await databaseServices.UpdateFeedback(complaintModel,userId,complaintId);
      print("Request Status $feedback");

      setState(ViewState.idle);

      await ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('your feed successfully updated'),
        ),
      );
    } catch (e) {
      setState(ViewState.idle);

      print("Error in update complaint request: $e");
    }
  }


}
