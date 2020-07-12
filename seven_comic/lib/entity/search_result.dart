import 'package:sevencomic/entity/search_result_entity.dart';

class SearchResultList {
  final List<SearchResultEntity> index;

  SearchResultList({this.index});

  factory SearchResultList.fromJson(List<dynamic> parsedJson) {

    List<SearchResultEntity> list = new List<SearchResultEntity>();
    list = parsedJson.map((i)=>SearchResultEntity().fromJson(i)).toList();

    return new SearchResultList(
        index: list
    );
  }
}