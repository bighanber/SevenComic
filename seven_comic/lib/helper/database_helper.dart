import 'dart:io';

import 'package:path_provider/path_provider.dart';
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
  }

}