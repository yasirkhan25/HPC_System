import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import "package:googleapis_auth/auth_io.dart";

class NetworkServices {

  /// Use service account credentials to get an authenticated and auto refreshing client.
  static  Future<String> obtainAuthenticatedClient() async {
    final accountCredentials = ServiceAccountCredentials.fromJson(
        {
          "type": "service_account",
          "project_id": "hangu-pesco-complaint",
          "private_key_id": "f312ac071be3dc31ca1a69cb91537e1f4b0d276d",
          "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC9GOMg+a+sHmT2\nhK0UDHx6eqrKlH+qbdTdaqTNWSFnH1G0EixgeEtdqplPAjFJB3TRXPdCDKEN9Vv+\ndzpspVoqp7gMntdgQqyq3XB8uRyydbq24+OEws/YnBymSTEVL1cjJy/jZaLVIdb9\nNxFhi+g4qlIo3L/6TAa04PsxuWCAWQKnizx/xaMo/RYn+jy8iSnwX+RlJM/u/8qX\nJG0ZOoR6JvcNrruEaEwGd9yJmGm9KVHqpG+eXoay4OE80CZ1dEKn2duJBlc4qNZA\njYGCSSFzBCeiB1PiiYlC1eEzh4gZXym7ayZUp2krTgsoH0OlNOkuS/1QhMUHr/CD\nee/i3Ee5AgMBAAECggEAEH+xBI3oixvZSw2LNOg8farBh1yi0XXVCG8fOzgDQzY/\nOJcL1mx0hfMGPpemQXUUNxa1j6aesEM30DlqqHNabUWWOEqtJ83VdzCMOaOkmnkN\nbhru3WTqgd+oG8Wf0dWANLXc9qol5ZL26T/CZViRzczlj4FoQjBbNvG41Q8zuWr0\nDE7s1JhQSKFjJbwr8tlzPddDN37O5/ajf5LthM+cDO82CC1YdhM1dasqLi4f+71/\nv/36w5Guyf6tZkq7P+s1/XMqKPijueEQBaxk+7ptS9VToQ93Usi9sXNzWqwYmXqH\nvslca03BJUdzK/nsqsi7TuUg29maaa5uVaH6Im3c8QKBgQD5/Atv2FX8/TTKBrF7\ncoPXBt39r9yMdZOfQ5/hHwd34hWYqwZ9CeH6KEqLcMssgoNuquHa5qxEQAZM//I3\nNpX9FQ1b59GWPaPC+3hSZaHs4lh2Xlz1Y03dVhzaWLU3pNsA/XUWp4M0j/qSCdTi\nPhGDYOLq5XYvmjWUj6in7IHxcQKBgQDBpcOnOboBlR+8xXDzQF3AaAV9FZeq3Saw\nI0xbPA5JwNu68OWPu+XfwT0nwkDd8T4vKCfzcWSlZLawgudSvAHt85WfXCKS8e4H\nXgX41vYqzJnUt0j/7/SMy6AxnDI9C0XsriFYM6rR2TAveDIHyVtYQPnDNy/nNDaJ\noyOsfHYWyQKBgAPn7EXTG4TYb/q4IA3NvEGf2dgc51VKgQP8CoN5+KPm5G9+PJu3\ni9Bc0M1c9c+8OlGAWgcRk599YJvTY/V45N8PdSX6eUvfqq9hPoALFnydDMTMtKcg\n5haPQeQnfq1f5gwd6bZw55vqo/+kJ69hSOTEnscMzsvvnOa1V+1HxMABAoGAcRgh\nm1GQe4ofPf1FyRsnZc6angH1URnVlXsYBhSd958F9TjpqTdAupw93jGJ9tUEzz+x\njXEFKb8XHyFkfiJFMjZXhPmnS5C1xmG4NSs+G6LgmKXuoWL/vRbTWQXzJUmnLeJI\noR2TvvkMNj0JYxjLG1DfTY62kF4jF+FKXVtXEFkCgYEA9NSZIc0qJXcrO8ReLgk1\ngge9pYUkHm5uxyVz55V11q/NmPVAr3iEG6rHguGaNAhW7VHfVOGx+DSEMGtx+qeo\nFnI0ORJKWgXcX1sLdoMbWydXxclF6SpM/oFrn8jdZmd28Ep2ZsDHeqQ5Kd7M9fkN\nyWO9hhpS9tvP9EKr7eyF/kw=\n-----END PRIVATE KEY-----\n",
          "client_email": "firebase-adminsdk-ln31w@hangu-pesco-complaint.iam.gserviceaccount.com",
          "client_id": "111934154294217833246",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-ln31w%40hangu-pesco-complaint.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }

    );
    var scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

    AuthClient client = await clientViaServiceAccount(
        accountCredentials, scopes);

    log('accesstoken '+client.credentials.accessToken.data);

    return client.credentials.accessToken.data;
  }


  static Future sendNotification(
      {String? token, String? title, String? body}) async {

    String accessToken = await obtainAuthenticatedClient();
    String serverKey =
        'Bearer ' + accessToken;
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
      "message":{
        "token":token,
        "notification":notificationMap,
        "data": dataMap,
      }
    };

    var response = await http.post(
        Uri.parse('https://fcm.googleapis.com/v1/projects/hangu-pesco-complaint/messages:send'),
        headers: headerMap,
        body: jsonEncode(bodyMap));
    log("responseee ${response.body}");
    var data = jsonDecode(response.body);

    return ;
  }
}