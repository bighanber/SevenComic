import 'package:dio/dio.dart';

class AppException implements Exception {
  String msg;
  int code;

  AppException([this.msg, this.code]);

  String toString() {
    return "$code - $msg";
  }

  factory AppException.create(DioError error) {
    switch(error.type) {
      case DioErrorType.CANCEL:
        return BadRequestException("请求取消", -1);
        break;

      case DioErrorType.CONNECT_TIMEOUT:
        return BadRequestException("连接超时", -1);
        break;

      case DioErrorType.SEND_TIMEOUT:
        return BadRequestException("请求超时", -1);
        break;

      case DioErrorType.RECEIVE_TIMEOUT:
        return BadRequestException("响应超时", -1);
        break;

      case DioErrorType.RESPONSE:
        int errCode = error.response.statusCode;
        switch(errCode) {
          case 400:
            return BadRequestException("请求语法错误", errCode);
            break;

          case 401:
            return BadRequestException("没有权限", errCode);
            break;

          case 403:
            return BadRequestException("服务器拒绝执行", errCode);
            break;

          case 404:
            return BadRequestException("无法连接服务器", errCode);
            break;

          case 405:
            return BadRequestException("请求方法被禁止", errCode);
            break;

          case 500:
            return BadRequestException("服务器内部错误", errCode);
            break;

          case 502:
            return BadRequestException("无效的请求", errCode);
            break;

          case 503:
            return BadRequestException("服务器挂了", errCode);
            break;

          case 505:
            return BadRequestException("不支持HTTP协议请求", errCode);
            break;

          default:
            return AppException(error.response.statusMessage, errCode);
        }
        break;

      default:
        return AppException(error.message, -1);
    }
  }
}

class BadRequestException extends AppException {
  BadRequestException([String msg, int code]) : super(msg, code);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String msg, int code]) : super(msg, code);
}
