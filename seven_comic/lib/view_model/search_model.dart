import 'package:flutter/foundation.dart';
import 'package:sevencomic/net/api_response.dart';
import 'package:sevencomic/provider/view_state_list_model.dart';
import 'package:sevencomic/provider/view_state_refresh_list_model.dart';
import 'package:sevencomic/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String searchHistory = 'searchHistory';

class SearchResultModel extends ViewStateRefreshListModel {
  String keyword;
  SearchHistoryModel searchHistoryModel;

  SearchResultModel({this.keyword, this.searchHistoryModel});

  @override
  Future<List> loadData({int pageNum}) async {
    if (keyword.isEmpty) return [];
    searchHistoryModel.addHistory(keyword);
    try {
      var entity = await Repository.getSearchResult(keyword, pageNum);
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

class SearchHistoryModel extends ViewStateListModel {

  clearHistory() async {
    var sp = await SharedPreferences.getInstance();
    sp.remove(searchHistory);
    list.clear();
    setEmpty();
  }

  addHistory(String keyword) async {
    var sp = await SharedPreferences.getInstance();
    var histories = sp.getStringList(searchHistory) ?? [];
    histories
      ..remove(keyword)
      ..insert(0, keyword);
    await sp.setStringList(searchHistory, histories);
    notifyListeners();
  }

  @override
  Future<List> loadData() async {
    print("loadHistory");
    var sp = await SharedPreferences.getInstance();
    return sp.getStringList(searchHistory) ?? [];
  }


}

class SearchHotModel extends ViewStateListModel {
  @override
  Future<List> loadData() async {
    try {
      var entity = await Repository.getHotSearch();
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
