import 'package:sevencomic/entity/hot_search_entity.dart';

class HotSearchList {
  final List<HotSearchEntity> index;

  HotSearchList({this.index});

  factory HotSearchList.fromJson(List<dynamic> parsedJson) {

    List<HotSearchEntity> list = new List<HotSearchEntity>();
    list = parsedJson.map((i)=>HotSearchEntity().fromJson(i)).toList();

    return new HotSearchList(
        index: list
    );
  }
}