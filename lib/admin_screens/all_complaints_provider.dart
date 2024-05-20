import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/models/base_view_model.dart';
import '../../../core/services/database_services.dart';
import '../../../core/services/database_storage_services.dart';
import '../../core/models/complaint_model.dart';
import '../core/enums/view_state.dart';
import '../core/models/meter_request_model.dart';

class AllComplaintProvider extends BaseViewModal {
  final formKey = GlobalKey<FormState>();
  DatabaseStorageServices databaseStorageServices = DatabaseStorageServices();
  DatabaseServices databaseServices = DatabaseServices();
  ComplaintModel complaintModel = ComplaintModel();
  MeterRequestModel meterRequestModel = MeterRequestModel();

  AllComplaintProvider() {
    print("constructor calling ... >>>");
    getAllComplaints();
    getMeterRequest();
  }


  List<ComplaintModel> pendingComplaints = [];
  List<ComplaintModel> urgentPendingComplaints = [];
  List<MeterRequestModel> meterRequest = [];
  List<ComplaintModel> approvedComplaints = [];
  List<ComplaintModel> rejectComplaints = [];
  Stream<QuerySnapshot>? complaintStream;
  Stream<QuerySnapshot>? requestStream;

  /// Get All Complaints ======>>>>
  void getAllComplaints() async {
    complaintStream = await databaseServices.getAllUserComplaints();
    complaintStream!.listen((event) {
      pendingComplaints = [];
      urgentPendingComplaints = [];
      approvedComplaints = [];
      rejectComplaints = [];

      if (event.docs.isNotEmpty) {
        event.docs.forEach((element) {
          final post = ComplaintModel.fromJson(element.data());
          if (post.complaintStatus == 'pending' && post.complaintTitle != "Meter Sparking/Wire Loose") {
            pendingComplaints.add(post);
            notifyListeners();
          }
          if (post.complaintTitle == "Meter Sparking/Wire Loose" || post.complaintStatus == "pending" && post.complaintStatus == "approved") {
            urgentPendingComplaints.add(post);
            notifyListeners();
          }
          if (post.complaintStatus == 'approved'&& post.complaintTitle != "Meter Sparking/Wire Loose") {
            approvedComplaints.add(post);
            notifyListeners();
          }
          if (post.complaintTitle == 'Meter Sparking/Wire Loose') {
            rejectComplaints.add(post);
            notifyListeners();
          }
        });
      }
    });
    notifyListeners();
  }

  /// Get Meter Complaints ======>>>>
  void getMeterRequest() async {
    requestStream = await databaseServices.getAllMeterRequests();
    requestStream!.listen((event) {
      meterRequest = [];

      if (event.docs.isNotEmpty) {
        event.docs.forEach((element) {
          final post = MeterRequestModel.fromJson(element.data());
          if (post.meterStatus == 'pending') {
            meterRequest.add(post);
            notifyListeners();
          }

            notifyListeners();

        });
      }
    });
    notifyListeners();
  }



  /// Approved Request Function ========>>>
  updateComplaintRequest(BuildContext context,String complaintStatus, ComplaintModel complaintModel, int index) async {
    setState(ViewState.busy);
    await Future.delayed(
      const Duration(seconds: 1),);
    try {
      print("2222222222222");
      print(complaintStatus);
      complaintModel.complaintStatus = complaintStatus;

      await databaseServices.UpdateComplaints(
          complaintModel, pendingComplaints[index].complaintID, pendingComplaints[index].userID);
      print("Request Status $complaintStatus");

      setState(ViewState.idle);

      await ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('complaint request $complaintStatus successfully!'),
        ),
      );
    } catch (e) {
      setState(ViewState.idle);

      print("Error in update complaint request: $e");
    }
  }

  /// emergency Request Function ========>>>
  updateUrgentComplaintRequest(BuildContext context,String complaintStatus, ComplaintModel complaintModel, int index) async {
    setState(ViewState.busy);
    await Future.delayed(
      const Duration(seconds: 1),);
    try {
      print("2222222222222");
      print(complaintStatus);
      complaintModel.complaintStatus = complaintStatus;

      await databaseServices.UpdateComplaints(
          complaintModel, urgentPendingComplaints[index].complaintID, urgentPendingComplaints[index].userID);
      print("Request Status $complaintStatus");

      setState(ViewState.idle);

      await ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('complaint request $complaintStatus successfully!'),
        ),
      );
    } catch (e) {
      setState(ViewState.idle);

      print("Error in update complaint request: $e");
    }
  }


  /// Date Format Method >>>>
  String dataFormate(String date) {
    DateTime inputDate = DateTime.parse(date);

    String formattedDate = DateFormat('d MMM yyyy', 'en_US').format(inputDate);
    return formattedDate;
  }

}
