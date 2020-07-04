import 'package:dio/dio.dart';
import 'package:sevencomic/entity/index_entity.dart';

import 'entity/comic_detail_entity.dart';
import 'entity/index_recommend.dart';
import 'net/api_response.dart';
import 'net/http_utils.dart';

class Repository {
  static final String categories = "recommend_new.json";

  static Future<ApiResponse<IndexList>> getCategories() async {
    try {
      final response = await HttpUtils.get(categories);
      var data = IndexList.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }

  static Future<ApiResponse<ComicDetailEntity>> getComicDetail(int comicId) async {
    try {
      final response = await HttpUtils.get("comic/comic_$comicId.json");
      var data = ComicDetailEntity().fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}