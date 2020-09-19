import 'package:http/http.dart' as http;

import 'app_upload.dart';

class UploadApp {
  Future<AppUpload> uploadApp(String seetestAccessKey, String nexusUrl,
      String deviceId, String registrationsDetails, String environment) async {
    final String apiUrl =
        "http://28.10.73.93:80/downlaodAndUploadBuildToSeeTest";

    final response = await http.post(apiUrl, body: {
      "buildUrl": nexusUrl,
      "bearerToken": seetestAccessKey,
      "project": "BMB",
      "isExternal": "false"
    });
    print("Api is ready to hit");

    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString.toString());
      return appUploadFromJson(responseString);
    } else {
      print(response.statusCode.toString());
      return null;
    }
  }
}
