import 'package:sevencomic/entity/comic_news_entity.dart';

class ComicNewsList {
  final List<ComicNewsEntity> index;

  ComicNewsList({this.index});

  factory ComicNewsList.fromJson(List<dynamic> parsedJson) {

    List<ComicNewsEntity> list = new List<ComicNewsEntity>();
    list = parsedJson.map((i)=>ComicNewsEntity().fromJson(i)).toList();

    return new ComicNewsList(
        index: list
    );
  }
}