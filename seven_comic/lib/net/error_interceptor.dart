import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sevencomic/net/app_exceptions.dart';

class ErrorInterceptor extends Interceptor {

  @override
  Future onError(DioError err) {
    AppException exception = AppException.create(err);
    debugPrint("dio error : ${exception.toString()}");
    err.error = exception;
    return super.onError(err);
  }
}