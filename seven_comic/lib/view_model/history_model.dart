import 'package:flutter/foundation.dart';
import 'package:sevencomic/entity/history_entity.dart';
import 'package:sevencomic/helper/database_helper.dart';
import 'package:sevencomic/provider/view_state_refresh_list_model.dart';
import 'package:sqflite/sqflite.dart';

class HistoryModel extends ViewStateRefreshListModel {
  List<HistoryEntity> _historyList;

  List<HistoryEntity> get historyList => _historyList;

  GlobalHistoryStateModel model;
  HistoryModel({@required this.model});

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

  addHistory(HistoryEntity entity) {
    model.addHistory(entity);
  }

  getHistoryById(String id, String chapterId) {
    model.getHistoryById(id, chapterId);
  }

  addReadMap(String chapterId) {
    model.addReadMap(chapterId);
  }
}

class GlobalHistoryStateModel extends ChangeNotifier {
  Map<String, bool> readMap = Map();

//  static refresh(List<HistoryEntity> list) {
//    list.forEach((value) {
//      if (_map.containsKey(value.comicId)) {
//        _map[value.comicId] = value.collect;
//      }
//    });
//  }

  addReadMap(String chapterId) {
    readMap.clear();
    readMap[chapterId] = true;
  }

  addHistory(HistoryEntity entity) {
    DatabaseHelper helper = DatabaseHelper();
    Future<Database> dbFuture = helper.initializeDatabase();
    dbFuture.then((value) {
      helper.getHistoryById(entity.comicId).then((value) {
        if (value.isEmpty) {
          helper.insertHistory(entity).then((value) {
            notifyListeners();
          });
        } else {
          helper.updateHistory(entity).then((value) {
            notifyListeners();
          });
        }
      });
    });
  }

  getHistoryById(String id, String chapterId) {
    readMap.clear();
    DatabaseHelper helper = DatabaseHelper();
    Future<Database> dbFuture = helper.initializeDatabase();
    dbFuture.then((value) {
      helper.getHistoryById(id).then((value) {
        if (value.isEmpty) {
          notifyListeners();
        } else if (value[0].chapterId == chapterId) {
          readMap[chapterId] = true;
          notifyListeners();
        }
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
