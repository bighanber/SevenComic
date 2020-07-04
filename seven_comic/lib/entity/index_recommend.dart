import 'index_entity.dart';

class IndexList {
  final List<IndexEntity> index;

  IndexList({this.index});

  factory IndexList.fromJson(List<dynamic> parsedJson) {

    List<IndexEntity> list = new List<IndexEntity>();
    list = parsedJson.map((i)=>IndexEntity().fromJson(i)).toList();

    return new IndexList(
        index: list
    );
  }
}