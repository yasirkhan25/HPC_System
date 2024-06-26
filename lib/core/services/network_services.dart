import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkServices {
  /// Use service account credentials to get an authenticated and auto refreshing client.
  static Future<String> obtainAuthenticatedClient() async {
    final accountCredentials = ServiceAccountCredentials.fromJson(
        {
      "type": "service_account",
      "project_id": "hangu-pesco-complaint",
      "private_key_id": "20c19b3801ea8ce77fea24b690e4c9b781219c72",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQClY3hvz0Fgo96N\nrw/zC+OBtGvQlUX6b67QwUaZ819UdlxUPAxxRLKYyReTpfj+nGnNpQmrJopp9YKp\nl/kdze33i3PVlSjOHlEW5+0ZU9RGV0yhT3wLOvVabDSk+7lBHKsSS3ZfA8Dj+D2x\nzt4lUzo4QlZ8wdiP/JcxBiZyryR6SESfI8JF8cV7l2RoV5ZvG6bbdE0tsoG1EPfX\nc4HcqtmEQKaGr2qLROS5tHlmkKtFqwNPcGZTo6u+H7nAAJ/AdW9ZKc0Mc9ww6D1K\nl953KV5fbaN6xY79fCipbFdg+se2ROgQequ2zoR1RAxH9f8jMYQmiYDhwX/+TdtZ\ntZIHZGC9AgMBAAECggEAOUQ+jRSKEjDbnFqcHq+kqKI03MX7M5KdSPpLfH4ZKbFM\nGfyq4EOFxcKHj9/d3ieBuSums+UF81eH1Tpij2/hMKBQTQm3VduIf3JyFh2BOJP8\n3DQeAvN4xkUGW4Qv6rxG/fA0PgUaMrWfgyRapjjxxU4vDUa/umefYGG9SWOcsVwq\n0YMKDe0HqwnWq7aLEdtRPxop8h6KJzLqKrkrDtUFXQJHt4nD6U5z2SU6/0m0WumI\nrwH12LjLxmaUgLkqR087LsrKN0LnP6p1pahK0g4M1eZ2PpBHk7WKOynidfymcp7k\nN0JGG5Oz3PAr4C1a18U70LwP9qdJXSJCHkBX0x1GXwKBgQDcuxR8Pxkg3Xp8lpEM\nKyLIHpPq+eE5/1UMEhI097u1tF6WVuG086HDcyRMmc2bL3RiRwi7CvBXnwJ6VpG9\nvzNvvFeg1JIP/C4eBgJewx/srT2lhvzE1ROlgh3CHp0bTj826Gs36l6G5FcrGUMG\nXEGbF0sC0qXiST9NyXPXDmu5dwKBgQC/0KKLRBAlUbGObRfxRpz9Gir6+zg2gNdT\nHflC6/BcmI7iSn1UuCa/J+CUoHD2PASlddNvWakHYlopdfKi+4EWyiewsv458ZKv\nWdDlGdiY9gYjC3ajUQw0PpWkbagQFaGhC47xgHAQgutTLPWNtfx3KJ32pzucCGsY\nkMDqGEgEawKBgQCnryu508mIMRkLKusX/nEW7Dvc52XVxIZcfCH+wTCFsnek6G3h\nJLCAJamu06zhtqRIwMP+LCo3tmGQhNGE/4rY2JENak9n+2Ehh9knGj7XcyiA5lKC\nSYj6VCW9QbqCcugNE3XYbaDQAwnBgRhs7Ysdgg2HIHXKuXBw7JinCJqHswKBgE6G\nzWSSUsHUdgpG4zxlmjOMGPhzDIpTqNNgPAGHsflWg3hk4nZihYpQewKdxGEqJQTP\n/eViIW7iduLuZI0QxcJctG8EeEukeFbNQFXqhN/qKI0ETmeB8KsazAxq0Bj1ohva\nLYT0/evkjQ6aI1UGofruZ+zofeDdGWsPJ8sucZ1NAoGBAIfpSPj5RbTbGfss7A8b\n0KvF2hgxKl2tpCsb3ecFwY4W67I3/sONFyHQcFY2XxMBVEwvcKMlelXo3nDWZcRY\nepKbrsOySzZ3kWgSsCdkEgYkrvaRvVVo5JseIkrQqFDj7yccfEwibTVHZsfG76nF\nXXUymrLXrl5U33ChG932lr4a\n-----END PRIVATE KEY-----\n",
      "client_email":
          "hangu-pesco-complaint@hangu-pesco-complaint.iam.gserviceaccount.com",
      "client_id": "113228908028765268964",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/hangu-pesco-complaint%40hangu-pesco-complaint.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    }
    );

    var scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

    AuthClient client =
        await clientViaServiceAccount(accountCredentials, scopes);
    return client.credentials.accessToken.data;
  }

  static Future sendNotification(
      {String? token, String? title, String? body}) async {
    String accessToken = await obtainAuthenticatedClient();
    String serverKey = 'Bearer ' + accessToken;
    Map<String, String> headerMap = {
      "Content-Type": "application/json",
      "Authorization": serverKey
    };

    Map notificationMap = {'title': title, 'body': body};

    Map dataMap = {
      "click_action": "FLUTTER_NOTIFICATION_CLICK",
      "id": "1",
      "status": "done",
    };

    Map bodyMap = {
      "message": {
        "token": token,
        "notification": notificationMap,
        "data": dataMap,
      }
    };
    var response = await http.post(
        Uri.parse(
            'https://fcm.googleapis.com/v1/projects/hangu-pesco-complaint/messages:send'),
        headers: headerMap,
        body: jsonEncode(bodyMap));
    print("Response code: ${response.statusCode}");
    print("Response body: ${response.body}");
    var data = jsonDecode(response.body);
    return;
  }
}
