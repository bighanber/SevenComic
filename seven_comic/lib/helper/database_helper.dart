import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sevencomic/entity/favorite_entity.dart';
import 'package:sevencomic/entity/history_entity.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static DatabaseHelper _databaseHelper;
  static Database _database;

  String historyTable = "history_table";
  String favoriteTable = "favorite_table";

  String colId = "comic_id";
  String colTitle = "comic_title";
  String colReadChapter = "read_chapter";
  String colLatestChapter = "latest_chapter";
  String colReadTime = "read_time";
  String colImg = "comic_img";

  String colUpdate = "comic_update";
  String colAddId = "favorite_add_id";

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    
    return _database;
  }
  
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'comic.db';
    
    var comicDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return comicDatabase;
  }
  
  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $historyTable($colId TEXT PRIMARY KEY, $colTitle TEXT, '
        '$colReadChapter TEXT, $colLatestChapter TEXT, $colReadTime TEXT, $colImg TEXT)');

    await db.execute('CREATE TABLE $favoriteTable($colId TEXT PRIMARY KEY, $colTitle TEXT, '
        '$colReadChapter TEXT, $colLatestChapter TEXT, $colReadTime TEXT, $colImg TEXT, $colUpdate TEXT, $colAddId TEXT)');
  }

  Future<List<Map<String, dynamic>>> getHistoryMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $todoTable order by $colTitle ASC');
    var result = await db.query(historyTable);
    return result;
  }

  Future<List<HistoryEntity>> getHistoryList() async {

    var mapList = await getHistoryMapList();
    int count = mapList.length;

    List<HistoryEntity> historyList = List<HistoryEntity>();
    for (int i = 0; i < count; i++) {
      historyList.add(HistoryEntity().fromJson(mapList[i]));
    }

    return historyList;
  }

  Future<int> insertHistory(HistoryEntity historyEntity) async {
    Database db = await this.database;
    var result = await db.insert(historyTable, historyEntity.toJson());
    return result;
  }

  Future<int> updateHistory(HistoryEntity historyEntity) async {
    Database db = await this.database;
    var result = await db.update(historyTable, historyEntity.toJson(), where: '$colId = ?', whereArgs: [historyEntity.comicId]);
    return result;
  }

  Future<List<Map<String, dynamic>>> getFavoriteMapList() async {
    Database db = await this.database;

    var result = await db.query(favoriteTable);
    return result;
  }

  Future<List<FavoriteEntity>> getFavoriteList() async {

    var mapList = await getFavoriteMapList();
    int count = mapList.length;

    List<FavoriteEntity> historyList = List<FavoriteEntity>();
    for (int i = 0; i < count; i++) {
      historyList.add(FavoriteEntity().fromJson(mapList[i]));
    }

    return historyList;
  }

  Future<int> insertFavorite(FavoriteEntity favoriteEntity) async {
    Database db = await this.database;
    var result = await db.insert(favoriteTable, favoriteEntity.toJson());
    return result;
  }

  Future<int> cancelFavorite(String id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $favoriteTable WHENE $colId = $id');
    return result;
  }
}