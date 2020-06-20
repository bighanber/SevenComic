import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:sevencomic/net/cache.dart';
import 'package:sevencomic/net/connectivity_request_retrier.dart';
import 'package:sevencomic/net/error_interceptor.dart';
import 'package:sevencomic/net/net_cache.dart';
import 'package:sevencomic/net/proxy.dart';
import 'package:sevencomic/net/retry_interceptor.dart';

import 'global.dart';

class Http {
  static const int CONNECT_TIMEOUT = 30000;
  static const int RECEIVE_TIMEOUT = 30000;

  static Http _instance = Http._internal();

  factory Http() => _instance;

  Dio dio;
  CancelToken _cancelToken = new CancelToken();

  Http._internal() {
    if (dio == null) {
      BaseOptions options = new BaseOptions(
          connectTimeout: CONNECT_TIMEOUT,
          receiveTimeout: RECEIVE_TIMEOUT,
          headers: {});
      dio = new Dio(options);

//      CookieJar cookieJar = CookieJar();
//      dio.interceptors.add(CookieManager(cookieJar));

      dio.interceptors.add(ErrorInterceptor());

      dio.interceptors.add(NetCacheInterceptor());
      if (Global.retryEnable) {
        dio.interceptors.add(RetryOnConnectionChangeInterceptor(
            retrier: DioConnectivityRequestRetrier(
                dio: dio, connectivity: Connectivity())));
      }
      dio.interceptors.add(LogInterceptor());

      if (PROXY_ENABLE) {
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (client) {
          client.findProxy = (uri) {
            return "PROXY $PROXY_IP:$PROXY_PORT";
          };
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
        };
      }
    }
  }

  void init(
      {String baseUrl,
      int connectTimeout,
      int receiveTimeout,
      List<Interceptor> interceptors}) {
    dio.options = dio.options.merge(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout);
    if (interceptors != null && interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
  }

  void setHeaders(Map<String, dynamic> map) {
    dio.options.headers.addAll(map);
  }

  void cancelRequest({CancelToken token}) {
    token ?? _cancelToken.cancel("canceled");
  }

  Map<String, dynamic> getAuthorizationHeader() {
    var headers;
    String accessToken = Global.accessToken;
    if (accessToken != null) {
      headers = {"Authorization": 'Bearer $accessToken'};
    }
    return headers;
  }

  Future get(
    String path, {
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
    bool refresh = false,
    bool noCache = !CACHE_ENABLE,
    String cacheKey,
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.merge(extra: {
      "refresh": refresh,
      "noCache": noCache,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk
    });

    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.merge(headers: _authorization);
    }
    Response response;
    response = await dio.get(path,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  Future post(String path,
      {Map<String, dynamic> params,
      data,
      Options options,
      CancelToken cancelToken}) async {
    Options requestOptions = options ?? Options();
    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.merge(headers: _authorization);
    }
    var response = await dio.post(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  Future put(String path,
      {data,
      Map<String, dynamic> params,
      Options options,
      CancelToken cancelToken}) async {
    Options requestOptions = options ?? Options();
    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.merge(headers: _authorization);
    }
    var response = await dio.put(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  Future patch(
    String path, {
    data,
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.merge(headers: _authorization);
    }
    var response = await dio.patch(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  Future delete(
    String path, {
    data,
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    Options requestOptions = options ?? Options();

    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.merge(headers: _authorization);
    }
    var response = await dio.delete(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  Future postForm(
    String path, {
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.merge(headers: _authorization);
    }
    var response = await dio.post(path,
        data: FormData.fromMap(params),
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }
}
