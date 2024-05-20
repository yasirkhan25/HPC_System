import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class DatabaseStorageServices {
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadUserImage(File image, String uuid) async {
    // final imagePath = image.path;
    try {
      var reference = _storage.ref().child("UserProfilesImages/$uuid");
      var uploadImage = reference.putFile(image);
      TaskSnapshot snapshot =
          await uploadImage.whenComplete(() => print('Image Uploaded'));
      final imageUrl = snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print("Exception@uploadUserImage=> $e");
      return null;
    }
  }
  /// Update Complaint Image >>>
  Future<String?> uploadComplaintImage(File complaintImage, String uuid) async {
    print("cccccccccccccc");
    // final imagePath = image.path;
    try {
      var reference = _storage.ref().child("ComplaintImages/$uuid");
      var uploadImage = reference.putFile(complaintImage);
      TaskSnapshot snapshot =
          await uploadImage.whenComplete(() => print('Complaint Image Uploaded'));
      final complaintImageUrl = snapshot.ref.getDownloadURL();
      return complaintImageUrl;
    } catch (e) {
      print("Exception@uploadJobComplaintImage=> $e");
      return null;
    }
  }


  // /// Update Payment Image >>>
  // Future<String?> uploadPaymentReceiptImage(File paymentReceiptImage, String uuid) async {
  //   try {
  //     var reference = _storage.ref().child("PaymentReceiptImages/$uuid");
  //     var uploadImage = reference.putFile(paymentReceiptImage);
  //     TaskSnapshot snapshot =
  //     await uploadImage.whenComplete(() => print('Payment Receipt Image Uploaded'));
  //     final paymentImageUrl = snapshot.ref.getDownloadURL();
  //     return paymentImageUrl;
  //   } catch (e) {
  //     print("Exception@uploadPaymentImage=> $e");
  //     return null;
  //   }
  // }
}
