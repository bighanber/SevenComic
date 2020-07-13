import 'package:sevencomic/net/api_response.dart';
import 'package:sevencomic/provider/view_state_list_model.dart';
import 'package:sevencomic/provider/view_state_refresh_list_model.dart';

import '../repository.dart';

class NewsHeaderModel extends ViewStateListModel {
  @override
  Future<List> loadData() async {
    try {
      var entity = await Repository.getNewsHeader();
      if (entity.status == Status.COMPLETED) {
        setIdle();
        return entity.data.data;
      } else {
        throw Exception(entity.exception);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

}

class NewsModel extends ViewStateRefreshListModel {
  @override
  Future<List> loadData({int pageNum}) async {
    try {
      var entity = await Repository.getNews(pageNum);
      if (entity.status == Status.COMPLETED) {
        setIdle();
        return entity.data.index;
      } else {
        throw Exception(entity.exception);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

}