import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  late ApiErrorModel apiErrorModel;

  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: 'Connection timeout with API server');

        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: 'Send timeout with API server');

        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: 'Receive timeout with API server');

        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);

        case DioExceptionType.unknown:
          return ApiErrorModel(
              message:
                  "Connection failed with API server due to Internet connection");

        case DioExceptionType.cancel:
          return ApiErrorModel(message: 'Request to API server was cancelled');

        default:
          return ApiErrorModel(message: "Something went wrong ");
      }
    } else {
      // default error
      return ApiErrorModel(message: "unexpected error occured");
    }
  }
}

ApiErrorModel _handleError(dynamic dataError) {
  return ApiErrorModel(
    message: dataError['message'] ?? 'Something went wrong',
    errorsData: dataError['data'],
    code: dataError['code'],
  );
}
