import 'package:http/http.dart' as http;

import 'MyHomePage.dart';
import 'app_upload.dart';

class UploadApp extends MyHomePage {
  uploadApp(String seetestAccessKey, String nexusUrl, String deviceId,
      String registrationsDetails, String environment) {
    Future<AppUpload> uploading(String name, String jobTitle) async {
      final String apiUrl = "https://reqres.in/api/users";

      final response =
          await http.post(apiUrl, body: {"name": name, "job": jobTitle});

      if (response.statusCode == 201) {
        final String responseString = response.body;

        return appUploadFromJson(responseString);
      } else {
        return null;
      }
    }
  }
}
