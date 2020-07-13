import 'package:dio/dio.dart';
import 'package:sevencomic/entity/comic_news.dart';
import 'package:sevencomic/entity/comic_news_header_entity.dart';
import 'package:sevencomic/entity/hot_search.dart';
import 'package:sevencomic/entity/index_rank.dart';
import 'package:sevencomic/entity/index_update.dart';
import 'package:sevencomic/entity/search_result.dart';

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

  static Future<ApiResponse<IndexRankList>> getComicRank(int type, int page) async {
    try {
      final response = await HttpUtils.get("rank/0/0/$type/$page.json");
      var data = IndexRankList.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }

  static Future<ApiResponse<IndexUpdateList>> getComicUpdate(int page) async {
    try {
      final response = await HttpUtils.get("latest/100/$page.json");
      var data = IndexUpdateList.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }

  static Future<ApiResponse<HotSearchList>> getHotSearch() async {
    try {
      final response = await HttpUtils.get("search/hot/0.json");
      var data = HotSearchList.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }

  static Future<ApiResponse<SearchResultList>> getSearchResult(String keyword, int page) async {
    try {
      final response = await HttpUtils.get("search/show/0/$keyword/$page.json");
      var data = SearchResultList.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }

  static Future<ApiResponse<ComicNewsHeaderEntity>> getNewsHeader() async {
    try {
      final response = await HttpUtils.get("v3/article/recommend/header.json");
      var data = ComicNewsHeaderEntity().fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }

  static Future<ApiResponse<ComicNewsList>> getNews(int page) async {
    try {
      final response = await HttpUtils.get("v3/article/list/0/2/$page.json");
      var data = ComicNewsList.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}