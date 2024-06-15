import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/complaint_model.dart';
import '../models/meter_request_model.dart';
import 'auth_services.dart';

class DatabaseServices {
  final firebaseFireStore = FirebaseFirestore.instance;

  ///
  ///  Registered Complaints  >>>>
  registerComplaint(ComplaintModel complaintModel,String UserID) {
    print(">>>>>>>>>>>Register Complaint Called >>>>");

    complaintModel.complaintID = DateTime.now().microsecondsSinceEpoch.toString();
    try {
      firebaseFireStore
          .collection("AllComplaints")
          .doc(UserID)
          .collection("Complaints")
          .doc(complaintModel.complaintID)
          .set(complaintModel.toJson());
      print("Current Complaint ID is >>>>${complaintModel.complaintID}");
      print("Current User ID is >>>> $UserID");
    } catch (e) {
      print('Exception $e');
    }
  }


  ///
  ///  Registered Complaints  >>>>
  registerMeterRequest(MeterRequestModel meterRequestModel,String UserID) {
    print(">>>>>>>>>>> meter Request Called >>>>");

    meterRequestModel.meterID = DateTime.now().microsecondsSinceEpoch.toString();
    try {
      firebaseFireStore
          .collection("AllMeterRequest")
          .doc(UserID)
          .collection("MeterRequest")
          .doc(meterRequestModel.meterID)
          .set(meterRequestModel.toJson());
      print("Current Meter ID is >>>>${meterRequestModel.meterID}");
      print("Current User ID is >>>> $UserID");
    } catch (e) {
      print('Exception $e');
    }
  }

  ///  get all User Complaints stream ... >>>
  Stream<QuerySnapshot>? getAllUserComplaints() {
    try {
      Stream<QuerySnapshot> snapshots =
          firebaseFireStore.collectionGroup("Complaints").snapshots();
      return snapshots;
    } catch (e) {
      print('Exception @DatabaseService/GetAllComplaints $e');
      return null;
    }
  }

  ///  get all User Meter request stream ... >>>
  Stream<QuerySnapshot>? getAllMeterRequests() {
    try {
      Stream<QuerySnapshot> snapshots =
          firebaseFireStore.collectionGroup("MeterRequest").snapshots();
      return snapshots;
    } catch (e) {
      print('Exception @DatabaseService/GetAllMeterRequest $e');
      return null;
    }
  }



  /// get User all Complaints by stream ... >>>
  Stream<QuerySnapshot>? getUserComplaints(String userID) {
    print("Get User Complaint is Called ??????");
    print("User ID is !!!!!!!!!!!1:$userID");
    try {
      Stream<QuerySnapshot> snapshots = firebaseFireStore
          .collection("AllComplaints")
          .doc(userID)
          .collection("Complaints")
          .snapshots();
      print("Snapshot Length is >>>${snapshots.length.toString()}");
      return snapshots;
    } catch (e) {
      print('Exception @DatabaseService/GetUserAllUserComplaints $e');
      return null;
    }
  }

  ///  Update Complaints =====>>>
  UpdateComplaints(ComplaintModel complaintModel,id,userID) async {
    print("status is ${complaintModel.complaintStatus}");
    print("User ID is ::: >>>>${userID}");
    try {
      await FirebaseFirestore.instance.collection('AllComplaints').doc(userID)
          .collection("Complaints").doc(id)
          .update({'complaintStatus':complaintModel.complaintStatus});
    } catch (e) {
      print('Exception@UpdateComplaintStatus=>$e');
    }
  }

  ///  Update Complaints =====>>>
  UpdateFeedback(ComplaintModel complaintModel,userId,complaintId) async {
    print("User ID is ::: >>>>>>>>>${userId}");
    print("User ID is ::: ??????>>>>${complaintId}");
    try {
      await FirebaseFirestore.instance.collection('AllComplaints').doc(userId)
          .collection("Complaints").doc(complaintId)
          .update({'feedBack':complaintModel.feedBack});
    } catch (e) {
      print('Exception@UpdateComplaintStatus=>$e');
    }
  }
}
