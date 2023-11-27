import 'package:flutter_core/src/entity/entity.dart';
import 'package:flutter_core/src/utils/result.dart';
import 'package:flutter_netwok_module/flutter_netwok_module.dart';
import 'package:learn_flutter/modules/page/data/api/adapters.dart';
import 'package:learn_flutter/modules/page/data/api/interceptors.dart';

class BaseNetworkConfig extends NetworkConfiguration {
  BaseNetworkConfig(
      {required super.baseURL, super.adapters, super.interceptors});
}

NetworkClient client = NetworkClient.fromConfig(BaseNetworkConfig(
    baseURL: BaseURL(
        baseURL: "https://ask-astrologer.leanq.digital/",
        baseVersionEndPath: 'api/'),
    interceptors: [PageDataInterceptor()],
    adapters: [PageDataAdapter()]));

// NetworkClient abnClient = NetworkClient.fromConfig(BaseNetworkConfig(
//     baseURL: BaseURL(
//         baseURL: "https://abr.business.gov.au/", baseVersionEndPath: "json/"),
//     adapters: [],
//     interceptors: []));

NetworkClient abnClient = NetworkClient.fromService(AbnDetailService(
    config: BaseNetworkConfig(
        baseURL: BaseURL(
            baseURL: "https://abr.business.gov.au/",
            baseVersionEndPath: "json/"),
        adapters: [],
        interceptors: [])));

class AbnDetailService extends NetworkService {
  AbnDetailService({required super.config});
  final Dio dioClient = Dio();
  @override
  Future<Result<NetworkFailure, NetworkResponseModel<T>>>
      delete<T extends Entity>(RequestApi api) {
    throw UnimplementedError();
  }

  @override
  Future<Result<NetworkFailure, NetworkResponseModel<T>>> get<T extends Entity>(
      RequestApi api) async {
    try {
      String finalUrl = config.baseURL.baseURL +
          config.baseURL.baseVersionEndPath +
          api.endPath;

      Response<dynamic> response = await dioClient.get(
        finalUrl,
        queryParameters: api.queryParams,
        options: Options(
          headers: api.headers,
        ),
      );
      Map<String, dynamic> customResponse = {};
      customResponse["data"] = response.data;
      return Success(NetworkResponseModel(
          api: api,
          statusCode: response.statusCode ?? 0,
          message: response.statusMessage ?? "",
          rowObject: customResponse));
    } catch (e) {
      return await _parseError(e);
    }
  }

  @override
  Future<Result<NetworkFailure, NetworkResponseModel<T>>>
      patch<T extends Entity>(RequestApi api) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<Result<NetworkFailure, NetworkResponseModel<T>>>
      post<T extends Entity>(RequestApi api) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Result<NetworkFailure, NetworkResponseModel<T>>> put<T extends Entity>(
      RequestApi api) {
    // TODO: implement put
    throw UnimplementedError();
  }

  Future<Result<NetworkFailure, NetworkResponseModel<T>>>
      _parseError<T extends Entity>(e) async {
    try {
      if (e is DioError) {
        if (e.response?.data != null) {
          final data = e.response?.data as Map<String, dynamic>;
          final error = data["message"] as String?;
          return Failure(NetworkFailure(
            message: error ?? e.toString(),
            statusCode: e.response?.statusCode ?? 400,
            rowObject: data,
          ));
        } else {
          // final connection = await checkInternetConnection();
          // if (connection) {
          //   return Failure(NetworkFailure(message: e.message, statusCode: 400));
          // } else {
          //   return Failure(const NetworkFailure(
          //       message:
          //           "Internet connection appears to be offline. Please check your internet connection.",
          //       statusCode: 522));
          // }
          return Failure(
              const NetworkFailure(statusCode: 0, message: "dont try it"));
        }
      } else {
        return Failure(NetworkFailure(message: e.toString(), statusCode: 400));
      }
    } catch (e) {
      return Failure(NetworkFailure(message: e.toString(), statusCode: 400));
    }
  }
}
