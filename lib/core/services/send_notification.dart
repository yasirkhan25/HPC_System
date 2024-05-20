import 'dart:convert';
import 'package:http/http.dart' as http;

class SendNotification {
  static sendPushMessage(
      {required String title,
      required String body,
      required String fcmToken,
      //required List<String> listOfFcmTokens,
      String? url}) async {
    try {
      await http
          .post(Uri.parse("https://fcm.googleapis.com/fcm/send"),
              headers: <String, String>{
                "Content-Type": "application/json",
                "Authorization":
                    "key=AAAAtpwzpho:APA91bEWiry0-RinQ26vV8H_M0G_j1jc_nTznAGeeIwnX5Ri6vjXRBlHXo1M4LrtHGudLDHJ7e_0W_dDVAkP2Y7Vdl2HsTy__6sRNrlZVRIOPo_jinei7l8aBRtVsNaybFXI5oPS3DQb"
              },
              body: jsonEncode(<String, dynamic>{
                "priority": "high",
                "data": <String, dynamic>{
                  "click_action": "FLUTTER_NOTIFICATION_CLICK",
                  "status": "done",
                  "body": body,
                  "title": title,
                  //  "url": url
                },
                "to": fcmToken,
                "notification": {
                  "title": title,
                  "body": body,
                  "mutable_content": true,
                  "sound": "Tri-tone",
                  "android_channel_id": "abce",
                },
              }))
          .then((value) async {
        print("sent successfully>>>.");
      });
    } catch (e) {
      print("some error");
    }
  }
}
