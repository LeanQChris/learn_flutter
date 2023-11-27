import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_netwok_module/flutter_netwok_module.dart';

class PageDataAdapter extends Adapter {
  @override
  Future<Result<NetworkFailure, NetworkResponseModel<T>>>
      onResponse<T extends Entity>(
          Result<NetworkFailure, NetworkResponseModel<T>> response,
          RequestApi api,
          NetworkClient client) async {
    return response;
  }
}
