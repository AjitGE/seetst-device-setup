import 'dart:convert';

AppUpload appUploadFromJson(String str) => AppUpload.fromJson(json.decode(str));

String appUploadToJson(AppUpload data) => json.encode(data.toJson());

class AppUpload {
  AppUpload({
    this.email,
    this.password,
  });

  String email;
  String password;

  factory AppUpload.fromJson(Map<String, dynamic> json) => AppUpload(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
