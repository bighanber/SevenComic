// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:sevencomic/entity/index_update_entity.dart';
import 'package:sevencomic/generated/json/index_update_entity_helper.dart';
import 'package:sevencomic/entity/index_entity.dart';
import 'package:sevencomic/generated/json/index_entity_helper.dart';
import 'package:sevencomic/entity/hot_search_entity.dart';
import 'package:sevencomic/generated/json/hot_search_entity_helper.dart';
import 'package:sevencomic/entity/search_result_entity.dart';
import 'package:sevencomic/generated/json/search_result_entity_helper.dart';
import 'package:sevencomic/entity/index_rank_entity.dart';
import 'package:sevencomic/generated/json/index_rank_entity_helper.dart';
import 'package:sevencomic/entity/comic_detail_entity.dart';
import 'package:sevencomic/generated/json/comic_detail_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case IndexUpdateEntity:
			return indexUpdateEntityFromJson(data as IndexUpdateEntity, json) as T;			case IndexEntity:
			return indexEntityFromJson(data as IndexEntity, json) as T;			case IndexData:
			return indexDataFromJson(data as IndexData, json) as T;			case HotSearchEntity:
			return hotSearchEntityFromJson(data as HotSearchEntity, json) as T;			case SearchResultEntity:
			return searchResultEntityFromJson(data as SearchResultEntity, json) as T;			case IndexRankEntity:
			return indexRankEntityFromJson(data as IndexRankEntity, json) as T;			case ComicDetailEntity:
			return comicDetailEntityFromJson(data as ComicDetailEntity, json) as T;			case ComicDetailStatu:
			return comicDetailStatuFromJson(data as ComicDetailStatu, json) as T;			case ComicDetailType:
			return comicDetailTypeFromJson(data as ComicDetailType, json) as T;			case ComicDetailAuthor:
			return comicDetailAuthorFromJson(data as ComicDetailAuthor, json) as T;			case ComicDetailChapter:
			return comicDetailChapterFromJson(data as ComicDetailChapter, json) as T;			case ComicDetailChaptersData:
			return comicDetailChaptersDataFromJson(data as ComicDetailChaptersData, json) as T;			case ComicDetailComment:
			return comicDetailCommentFromJson(data as ComicDetailComment, json) as T;			case ComicDetailCommantLatestCommant:
			return comicDetailCommantLatestCommantFromJson(data as ComicDetailCommantLatestCommant, json) as T;			case ComicDetailDhUrlLink:
			return comicDetailDhUrlLinkFromJson(data as ComicDetailDhUrlLink, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case IndexUpdateEntity:
			return indexUpdateEntityToJson(data as IndexUpdateEntity);			case IndexEntity:
			return indexEntityToJson(data as IndexEntity);			case IndexData:
			return indexDataToJson(data as IndexData);			case HotSearchEntity:
			return hotSearchEntityToJson(data as HotSearchEntity);			case SearchResultEntity:
			return searchResultEntityToJson(data as SearchResultEntity);			case IndexRankEntity:
			return indexRankEntityToJson(data as IndexRankEntity);			case ComicDetailEntity:
			return comicDetailEntityToJson(data as ComicDetailEntity);			case ComicDetailStatu:
			return comicDetailStatuToJson(data as ComicDetailStatu);			case ComicDetailType:
			return comicDetailTypeToJson(data as ComicDetailType);			case ComicDetailAuthor:
			return comicDetailAuthorToJson(data as ComicDetailAuthor);			case ComicDetailChapter:
			return comicDetailChapterToJson(data as ComicDetailChapter);			case ComicDetailChaptersData:
			return comicDetailChaptersDataToJson(data as ComicDetailChaptersData);			case ComicDetailComment:
			return comicDetailCommentToJson(data as ComicDetailComment);			case ComicDetailCommantLatestCommant:
			return comicDetailCommantLatestCommantToJson(data as ComicDetailCommantLatestCommant);			case ComicDetailDhUrlLink:
			return comicDetailDhUrlLinkToJson(data as ComicDetailDhUrlLink);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'IndexUpdateEntity':
			return IndexUpdateEntity().fromJson(json);			case 'IndexEntity':
			return IndexEntity().fromJson(json);			case 'IndexData':
			return IndexData().fromJson(json);			case 'HotSearchEntity':
			return HotSearchEntity().fromJson(json);			case 'SearchResultEntity':
			return SearchResultEntity().fromJson(json);			case 'IndexRankEntity':
			return IndexRankEntity().fromJson(json);			case 'ComicDetailEntity':
			return ComicDetailEntity().fromJson(json);			case 'ComicDetailStatu':
			return ComicDetailStatu().fromJson(json);			case 'ComicDetailType':
			return ComicDetailType().fromJson(json);			case 'ComicDetailAuthor':
			return ComicDetailAuthor().fromJson(json);			case 'ComicDetailChapter':
			return ComicDetailChapter().fromJson(json);			case 'ComicDetailChaptersData':
			return ComicDetailChaptersData().fromJson(json);			case 'ComicDetailComment':
			return ComicDetailComment().fromJson(json);			case 'ComicDetailCommantLatestCommant':
			return ComicDetailCommantLatestCommant().fromJson(json);			case 'ComicDetailDhUrlLink':
			return ComicDetailDhUrlLink().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'IndexUpdateEntity':
			return List<IndexUpdateEntity>();			case 'IndexEntity':
			return List<IndexEntity>();			case 'IndexData':
			return List<IndexData>();			case 'HotSearchEntity':
			return List<HotSearchEntity>();			case 'SearchResultEntity':
			return List<SearchResultEntity>();			case 'IndexRankEntity':
			return List<IndexRankEntity>();			case 'ComicDetailEntity':
			return List<ComicDetailEntity>();			case 'ComicDetailStatu':
			return List<ComicDetailStatu>();			case 'ComicDetailType':
			return List<ComicDetailType>();			case 'ComicDetailAuthor':
			return List<ComicDetailAuthor>();			case 'ComicDetailChapter':
			return List<ComicDetailChapter>();			case 'ComicDetailChaptersData':
			return List<ComicDetailChaptersData>();			case 'ComicDetailComment':
			return List<ComicDetailComment>();			case 'ComicDetailCommantLatestCommant':
			return List<ComicDetailCommantLatestCommant>();			case 'ComicDetailDhUrlLink':
			return List<ComicDetailDhUrlLink>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}