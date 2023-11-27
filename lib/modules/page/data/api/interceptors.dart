import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_netwok_module/flutter_netwok_module.dart';

class PageDataInterceptor extends AppInterceptor {
  @override
  Future<Result<NetworkFailure, RequestApi>> onRequest(
      RequestApi api, NetworkClient client) async {
    if (api.shouldRequireAccessToken) {
      print("api requires token");
    }
    return Success(api);
  }
}
