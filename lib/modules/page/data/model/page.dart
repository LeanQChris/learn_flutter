// Required as Entity to make an API Call
import 'package:flutter_core/flutter_core.dart';

class PageData extends Entity {
  int? statusCode;
  DateTime? timestamp;
  String? message;
  Data? data;

  PageData({
    this.statusCode,
    this.timestamp,
    this.message,
    this.data,
  });

  factory PageData.fromJson(Map<String, dynamic> json) => PageData(
        statusCode: json["statusCode"],
        timestamp: DateTime.parse(json["timestamp"]),
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  @override
  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "timestamp": timestamp?.toIso8601String(),
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String title;
  String body;

  Data({
    required this.title,
    required this.body,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
      };
}
