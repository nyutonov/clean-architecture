import 'package:dio/dio.dart';
import 'package:tana/core/network/response_data.dart';

import '../utils/utils.dart';

class RequestManager {
  final Dio dio;

  RequestManager({required this.dio});

  Future<ResponseData<T>> request<T>({
    required RequestMethod requestType,
    required String path,
    required T? Function(dynamic jsonData)? dataParser,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.request(
        path,
        options: Options(
          method: requestType.method,
        ),
        data: data,
        queryParameters: queryParameters,
      );

      return ResponseData(
        data: dataParser?.call(response.data),
        statusCode: response.statusCode ?? 200,
        ok: true,
      );
    } on DioException catch (error, stacktrace) {
      printError("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseData(
        error: error.response?.data["detail"] ?? error.response?.data.toString(),
        statusCode: error.response?.statusCode ?? 500,
      );
    } catch (error, stacktrace) {
      printError("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseData(
        error: "Something went wrong",
      );
    }
  }
}

enum RequestMethod {
  get,
  post,
  put,
  delete,
  patch;

  String get method => toString().split('.').last.toUpperCase();
}
