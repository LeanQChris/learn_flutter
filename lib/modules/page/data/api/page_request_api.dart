// Required for handling requst config for an api
import 'package:flutter_netwok_module/flutter_netwok_module.dart';
import 'package:learn_flutter/app/constants/endpoints.dart';

class PageDataApiPath extends RequestApi {
  PageDataApiPath({required super.parser, required this.pageName});

  String pageName;

  @override
  String get endPath => '${ApiEndpoints.getpages}$pageName';

  @override
  bool get shouldRequireAccessToken => true;
}
