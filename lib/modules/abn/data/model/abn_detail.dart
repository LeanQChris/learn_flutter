import 'package:flutter_core/flutter_core.dart';

class AbnResponse extends Entity {
  String? abn;
  String? abnStatus;
  String? abnStatusEffectiveFrom;
  String? acn;
  String? addressDate;
  String? addressPostcode;
  String? addressState;
  List<String>? businessName;
  String? entityName;
  String? entityTypeCode;
  String? entityTypeName;
  String? gst;
  String? message;

  AbnResponse({
    this.abn,
    this.abnStatus,
    this.abnStatusEffectiveFrom,
    this.acn,
    this.addressDate,
    this.addressPostcode,
    this.addressState,
    this.businessName,
    this.entityName,
    this.entityTypeCode,
    this.entityTypeName,
    this.gst,
    this.message,
  });

  factory AbnResponse.fromJson(Map<String, dynamic> json) {
    return AbnResponse(
      abn: json['Abn'],
      abnStatus: json['AbnStatus'],
      abnStatusEffectiveFrom: json['AbnStatusEffectiveFrom'],
      acn: json['Acn'],
      addressDate: json['AddressDate'],
      addressPostcode: json['AddressPostcode'],
      addressState: json['AddressState'],
      businessName: List<String>.from(json['BusinessName']),
      entityName: json['EntityName'],
      entityTypeCode: json['EntityTypeCode'],
      entityTypeName: json['EntityTypeName'],
      gst: json['Gst'],
      message: json['Message'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'Abn': abn,
      'AbnStatus': abnStatus,
      'AbnStatusEffectiveFrom': abnStatusEffectiveFrom,
      'Acn': acn,
      'AddressDate': addressDate,
      'AddressPostcode': addressPostcode,
      'AddressState': addressState,
      'BusinessName': businessName,
      'EntityName': entityName,
      'EntityTypeCode': entityTypeCode,
      'EntityTypeName': entityTypeName,
      'Gst': gst,
      'Message': message,
    };
  }
}
