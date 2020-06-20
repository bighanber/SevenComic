import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sevencomic/net/connectivity_request_retrier.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier retrier;

  RetryOnConnectionChangeInterceptor({@required this.retrier});

  @override
  Future onError(DioError err) async {
    if (_shouldRetry(err)) {
      return retrier.scheduleRequestRetry(err.request);
    }
    return err;
  }

  bool _shouldRetry(DioError error) {
    return error.type == DioErrorType.DEFAULT && error.error != null && error.error is SocketException;
  }
}