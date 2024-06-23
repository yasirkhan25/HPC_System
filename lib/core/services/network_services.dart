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
          "private_key_id": "d7ffe12bdfc1230b0af7833fed02333f975de7db",
          "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDbMU1pcC2VWXpq\nhgKj1Ie2xRXQy8+xqobLSDj/h2sMLOfviF+CgCOzA0KqhEduBMYCzeFdzFXS0yuH\nZf+sVHUzbV+pZCtri+6ibipoQ6u8upZ8dprqoEwzhB/SJ7kCMzdihcqAksCaCBlM\n1m0TXRBXsMAK4OAcgSgixlq8vf+Yx/rcn1OkIIQIwySz2hpXYLmshzZh9IcoErzO\nl4Kac6ZO0p53BI4St3tlU2EMIlxL+GQ5/L0ssRIwn+96KQGzWSXGnajyuTThgDNV\noxGYJ9AQ34fihQdBJCTYCTI/cjgjy0IzCu2hFF+aZy9jDBC3fwbDME2R2+QhqJxT\nZQXg4ItDAgMBAAECggEAUfyngXxRuI7fALA+lYwd9UnTxqUtez2XLLtHgqDi9Atp\n98kxPG10rPVXvtM6qpbDf/IFTaHsKi8NlZgb4Zg3vHQ5N3F94jzVllERsK07NB0w\nw75TZNZvmkdd5awxAfcpTMNRgvUhcJv95qU/6GHDhqFYu9jwSwkue49pCjchP0JA\ntWdPneSBHFEVvRJOBIYBdegS7KYCfTGOqTe4HRh6LEYwm6zTD0nPzdmGdDr2GRdh\nUjekIaVwwjStDOZDkt6bsezLvYsj8IcJui0z6MydHuQ/7EXPYluqKAmz7xZ9hauX\n9HgE4iOHEJDt53qrh+X+wSByISUnYnKDH1B5QdrZEQKBgQDzwbdjM8wdHwYSok/g\nbwETywbFrdZR1dDmPZ4zmTvxxsGwVB6bIxUB/Snc5ydFjnv43APg+huBPHa3Hzq9\nblcnbSNOsIo2BFvEfYotCnDjQJRdh8MKx0lEaPY4jI1oenGEdZXICmIZmL4MHOzY\nnVo9XnqC141eYCmYMu8VSugSswKBgQDmM7wNJSR2XEXIQmdBkdHm+XKa0EYMOaBY\ne3z5LH+j+0mktMkbiG5LME7xCIYfDBZRIKEGFRYrmck5LJiYkN2Pyr7JCWZYRugE\nKhJyy6XZ6U52VCkR1fq5IPHRhUtTcWJUVKpTRVmNCPyXBGLkIfXOZk+iM64elLjO\n5kUh8+atMQKBgBMXcBKgAvOg82vQNKtiZlYzh6NB+1BLi+IMn3BxJwXHyHHUFNWX\nyNRwDLBVlnjXMRSLvu4HCNJ1duLe2k3t73uSC7rlDt4uNzXLk1/1umPCMhylPnyA\noVdvVSGWuJifRnbWctXJImfY08HFHjPVFzVJShUnZtYmd/uIubsUM9sLAoGAHqLv\n+gfhbGcnWlmMCGvxtX2pRPVG/UWGE4CLx1WmvxooWOU+ho2HsDYDq4xo3STsq2te\nQsL3qmHTJ+rJfDR7aDGhZnv7xO/a3QMEZYa40eF88b6NoLQLpCvAQxQsTDSg03xZ\nFq/6FQ0HIMoSpy3l2sw++OVL3QIJ/m8i8DvXjWECgYBb4zGFpsaF68cX+LE7EKvc\nK22JIw6G9FwlJd9HRuz58xQZlYxUGvqQ6IMA+XxjdUIgBsaHQFC8UbY8a85AZGEG\njqkgqIJ55+uiSFOavDRHMeK5+PkTnK18jyIeKDtLBPDq+s+rtEpUSkDapQJ/FpcE\nVv8A9xu11Q8nkwB6+T73Tg==\n-----END PRIVATE KEY-----\n",
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