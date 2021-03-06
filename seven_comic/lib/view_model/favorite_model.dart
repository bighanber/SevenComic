import 'package:flutter/material.dart';
import 'package:sevencomic/entity/favorite_entity.dart';
import 'package:sevencomic/helper/database_helper.dart';
import 'package:sevencomic/provider/view_state_refresh_list_model.dart';
import 'package:sqflite/sqflite.dart';


class FavoriteModel extends ViewStateRefreshListModel {
  List<FavoriteEntity> _favoriteList;

  List<FavoriteEntity> get favoriteList => _favoriteList;

  @override
  Future<List> loadData({int pageNum}) async {
    try {
      DatabaseHelper helper = DatabaseHelper();

      Future<Database> dbFuture = helper.initializeDatabase();
      dbFuture.then((value) {
        Future<List<FavoriteEntity>> listF = helper.getFavoriteList();
        listF.then((value) {
          setIdle();
          _favoriteList = value;
        });
      });

      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}

class GlobalFavoriteStateModel extends ChangeNotifier {
  static final Map<String, bool> _map = Map();

//  static refresh(List<HistoryEntity> list) {
//    list.forEach((value) {
//      if (_map.containsKey(value.comicId)) {
//        _map[value.comicId] = value.collect;
//      }
//    });
//  }

  addFavorite(FavoriteEntity entity) {
    DatabaseHelper helper = DatabaseHelper();
    Future<Database> dbFuture = helper.initializeDatabase();
    dbFuture.then((value) {
      helper.insertFavorite(entity).then((value) {
        notifyListeners();
      });
    });
  }

  cancelFavorite(String id) {
    DatabaseHelper helper = DatabaseHelper();
    Future<Database> dbFuture = helper.initializeDatabase();
    dbFuture.then((value) {
      helper.cancelFavorite(id).then((value) {
        notifyListeners();
      });
    });
  }
}
/// 我的收藏列表
//class FavouriteListModel extends ViewStateRefreshListModel<Article> {
//  LoginModel loginModel;
//
//  FavouriteListModel({this.loginModel});
//
//  @override
//  void onError(ViewStateError viewStateError) {
//    super.onError(viewStateError);
//    if (viewStateError.isUnauthorized) {
//      loginModel.logout();
//    }
//  }
//
//
//  @override
//  Future<List<Article>> loadData({int pageNum}) async {
//    return await WanAndroidRepository.fetchCollectList(pageNum);
//  }
//}

/// 收藏/取消收藏
//class FavouriteModel extends ViewStateModel {
//  GlobalFavouriteStateModel globalFavouriteModel;
//
//  FavouriteModel({@required this.globalFavouriteModel});
//
//  collect(Article article) async {
//    setBusy();
//    try {
//      // article.collect 字段为null,代表是从我的收藏页面进入的 需要调用特殊的取消接口
//      if (article.collect == null) {
//        await WanAndroidRepository.unMyCollect(
//            id: article.id, originId: article.originId);
//        globalFavouriteModel.removeFavourite(article.originId);
//      } else {
//        if (article.collect) {
//          await WanAndroidRepository.unCollect(article.id);
//          globalFavouriteModel.removeFavourite(article.id);
//        } else {
//          await WanAndroidRepository.collect(article.id);
//          globalFavouriteModel.addFavourite(article.id);
//        }
//      }
//      article.collect = !(article.collect ?? true);
//      setIdle();
//    } catch (e, s) {
//      setError(e, s);
//    }
//  }
//}

class GlobalFavouriteStateModel extends ChangeNotifier {
  static final Map<int, bool> _map = Map();

//  static refresh(List<Article> list) {
//    list.forEach((article) {
//      if (_map.containsKey(article.id)) {
//        _map[article.id] = article.collect;
//      }
//    });
//  }

  addFavourite(int id) {
    _map[id] = true;
    notifyListeners();
  }

  removeFavourite(int id) {
    _map[id] = false;
    notifyListeners();
  }

  /// 用于切换用户后,将该用户所有收藏的文章,对应的状态置为true
  replaceAll(List ids) {
    _map.clear();
    ids.forEach((id) => _map[id] = true);
    notifyListeners();
  }

  contains(id) {
    return _map.containsKey(id);
  }

  operator [](int id) {
    return _map[id];
  }
}
