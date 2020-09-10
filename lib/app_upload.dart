import 'dart:convert';

AppUpload appUploadFromJson(String str) => AppUpload.fromJson(json.decode(str));

String appUploadToJson(AppUpload data) => json.encode(data.toJson());

class AppUpload {
  AppUpload({
    this.applicationId,
  });

  String applicationId;

  factory AppUpload.fromJson(Map<String, dynamic> json) => AppUpload(
        applicationId: json["applicationId"],
      );

  Map<String, dynamic> toJson() => {
        "applicationId": applicationId,
      };
}
