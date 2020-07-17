import 'package:flutter/foundation.dart';
import 'package:sevencomic/entity/history_entity.dart';
import 'package:sevencomic/helper/database_helper.dart';
import 'package:sevencomic/provider/view_state_refresh_list_model.dart';
import 'package:sqflite/sqflite.dart';

class HistoryModel extends ViewStateRefreshListModel {
  List<HistoryEntity> _historyList;

  List<HistoryEntity> get historyList => _historyList;

  @override
  Future<List> loadData({int pageNum}) async {
    try {
      DatabaseHelper helper = DatabaseHelper();

      Future<Database> dbFuture = helper.initializeDatabase();
      dbFuture.then((value) {
        Future<List<HistoryEntity>> listF = helper.getHistoryList();
        listF.then((value) {
          setIdle();
          _historyList = value;
        });
      });

      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}

class GlobalHistoryStateModel extends ChangeNotifier {
  static final Map<String, bool> _map = Map();

//  static refresh(List<HistoryEntity> list) {
//    list.forEach((value) {
//      if (_map.containsKey(value.comicId)) {
//        _map[value.comicId] = value.collect;
//      }
//    });
//  }

  addHistory(HistoryEntity entity) {
    DatabaseHelper helper = DatabaseHelper();
    Future<Database> dbFuture = helper.initializeDatabase();
    dbFuture.then((value) {
      helper.insertHistory(entity).then((value) {
        notifyListeners();
      });
    });
  }

  updateHistory(HistoryEntity entity) {
    DatabaseHelper helper = DatabaseHelper();
    Future<Database> dbFuture = helper.initializeDatabase();
    dbFuture.then((value) {
      helper.updateHistory(entity).then((value) {
        notifyListeners();
      });
    });
  }
}
