import 'package:dio/dio.dart';
import 'package:base_clean_architecture/core/network/exceptions/error_response.dart';

import '../network_constants.dart';
import 'error_exception.dart';

class NetworkHandler {
  static ErrorException handleError(DioError error) {
    return _handleError(error);
  }

  static ErrorException _handleError(error) {
    if (error is! DioError) {
      return ErrorException(
          NetworkConstants.ERROR_TITLE, NetworkConstants.ERROR_MESSAGE_NETWORK);
    }

    if (_isNetWorkError(error)) {
      return ErrorException(
          NetworkConstants.ERROR_TITLE, NetworkConstants.ERROR_MESSAGE_NETWORK);
    }
    final parsedException = _parseError(error);
    final errorCode = error.response?.statusCode;
    if (errorCode == 401) {
      // eventBus.fire(UnAuthEvent(""));
      return UnauthorizedException();
    }
    if (errorCode == 503) {
      return MaintenanceException();
    }
    return parsedException;
  }

  static bool _isNetWorkError(DioError error) {
    final errorType = error.type;
    switch (errorType) {
      case DioErrorType.cancel:
        return true;
      case DioErrorType.connectTimeout:
        return true;
      case DioErrorType.receiveTimeout:
        return true;
      case DioErrorType.sendTimeout:
        return true;
      case DioErrorType.other:
        return true;
      case DioErrorType.response:
        return false;
      default:
        return true;
    }
  }

  static ErrorException _parseError(DioError error) {
    if (error.response?.data is! Map<String, dynamic>) {
      return ErrorException(
          NetworkConstants.ERROR_TITLE, NetworkConstants.ERROR_MESSAGE_NETWORK);
    }
    final errorResponse = ErrorResponse.fromJson(error.response?.data);
    return ErrorException(NetworkConstants.ERROR_TITLE,
        errorResponse.message ?? NetworkConstants.ERROR_MESSAGE_NETWORK);
  }
}
