import 'package:flutter_netwok_module/flutter_netwok_module.dart';
import 'package:learn_flutter/app/constants/endpoints.dart';

class GetAbnDetailAPI extends RequestApi {
  GetAbnDetailAPI({required super.parser, required this.abnNumber});

  String abnNumber;
  @override
  String get endPath => ApiEndpoints.abnDetail;

  @override
  HTTPMethod get method => HTTPMethod.get;

  @override
  Map<String, dynamic> get queryParams => {
        "callback": "abnCallback",
        "abn": abnNumber,
        "guid": "0c7208ed-b7b7-42fd-9a4a-dded04b0271b",
        "noCacheIE": "1700206926286"
      };
}
