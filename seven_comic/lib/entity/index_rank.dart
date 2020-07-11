import 'package:sevencomic/entity/index_rank_entity.dart';

import 'index_entity.dart';

class IndexRankList {
  final List<IndexRankEntity> index;

  IndexRankList({this.index});

  factory IndexRankList.fromJson(List<dynamic> parsedJson) {

    List<IndexRankEntity> list = new List<IndexRankEntity>();
    list = parsedJson.map((i)=>IndexRankEntity().fromJson(i)).toList();

    return new IndexRankList(
        index: list
    );
  }
}