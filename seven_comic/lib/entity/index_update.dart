import 'package:sevencomic/entity/index_rank_entity.dart';
import 'package:sevencomic/entity/index_update_entity.dart';

import 'index_entity.dart';

class IndexUpdateList {
  final List<IndexUpdateEntity> index;

  IndexUpdateList({this.index});

  factory IndexUpdateList.fromJson(List<dynamic> parsedJson) {

    List<IndexUpdateEntity> list = new List<IndexUpdateEntity>();
    list = parsedJson.map((i)=>IndexUpdateEntity().fromJson(i)).toList();

    return new IndexUpdateList(
        index: list
    );
  }
}