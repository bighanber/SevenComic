import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:sevencomic/net/cache.dart';
import 'package:sevencomic/util/sp_utils.dart';

class CacheObject {
  Response response;
  int timeStamp;

  CacheObject(this.response) : timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  bool operator ==(other) {
    return response.hashCode == other.hashCode;
  }

  @override
  int get hashCode {
    return response.realUri.hashCode;
  }
}

class NetCacheInterceptor extends Interceptor {
  var cache = LinkedHashMap<String, CacheObject>();

  @override
  Future onRequest(RequestOptions options) async {
    if (!CACHE_ENABLE) return options;

    bool refresh = options.extra["refresh"] == true;
    bool cacheDisk = options.extra["cacheDisk"] == true;

    if (refresh) {
      delete(options.uri.toString());
      if (cacheDisk) {
        await SpUtils().remove(options.uri.toString());
      }
      return options;
    }

    if (options.extra["noCache"] != true && options.method.toLowerCase() == "get") {
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      var ob = cache[key];
      if (ob != null) {
        if ((DateTime.now().millisecondsSinceEpoch - ob.timeStamp) / 1000 < CACHE_MAX_AGE) {
          return cache[key].response;
        } else {
          cache.remove(key);
        }
      }

      if (cacheDisk) {
        var cacheData = SpUtils().getJson(key);
        if (cacheData != null) {
          return Response(statusCode: 200, data: cacheData);
        }
      }
    }
  }


  @override
  Future onError(DioError err) async {

  }


  @override
  Future onResponse(Response response) async {
    if (CACHE_ENABLE) {
      await _saveCache(response);
    }
  }

  Future<void> _saveCache(Response obj) async {
    RequestOptions options = obj.request;
    if (options.extra["noCache"] != true && options.method.toLowerCase() == "get") {
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      if (options.extra["cacheDisk"] == true) {
        await SpUtils().setJson(key, obj.data);
      }

      if (cache.length == CACHE_MAX_COUNT) {
        cache.remove(cache[cache.keys.first]);
      }

      cache[key] = CacheObject(obj);
    }
  }

  void delete(String key) {
    cache.remove(key);
  }
}

