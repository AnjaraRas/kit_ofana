import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:kit_ofana/models/ofana.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  static const String ofanaTable = 'ofana';
  static const String id = 'id';
  static const String titre = 'titre';
  static const String vht1 = 'vht1';
  static const String vht2 = 'vht2';
  static const String vht3 = 'vht3';
  static const String type = 'type';
  static const String sampana = 'sampana';
  static const String votoatiny = 'votoatiny';
  static const String isDeleted = 'isDeleted';

   Future<Database> get database async {
    if(_database != null)
    return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'ofana_demo.db'),
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE ofana  (id INTEGER PRIMARY KEY AUTOINCREMENT, titre TEXT, vht1 TEXT, vht2 TEXT, vht3 TEXT, type TEXT, sampana TEXT, votoatiny TEXT, isDeleted BIT NOT NULL
        )
        ''');
      },
      version: 1
    );
  }

  static void databaseLog(String functionName, String sql, 
  [List<Map<String, dynamic>> selectQueryResult, int insertAndUpdateQueryResult]){
    print(functionName);
    print(sql);
    if(selectQueryResult != null){
      print(selectQueryResult);
    }else if(insertAndUpdateQueryResult != null){
      print(insertAndUpdateQueryResult);
    }
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    //make sure the folder exists
    if(await Directory (dirname(path)).exists()){
      //await deleteDatabase(path);
    }else{
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }
  
  Future<dynamic> getAllOfana() async {
    final db = await database;
    var res = await db.query(ofanaTable);
    if(res.length == 0){
      return null;
    }else{
      var resMap = res.toList();
      return resMap.isNotEmpty ? resMap : Null;
    }
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(ofanaTable, where: 'id = ?', whereArgs: [id]);
  }

  Future<dynamic> getOfana(int id) async {
    final db = await database;
    var res = await db.query(ofanaTable, where: 'id = ?', whereArgs: [id]);
    if(res.length == 0){
      return null;
    }else{
      var resMap = res.toList();
      return resMap.isNotEmpty ? resMap : Null;
    }
  }

  Future<dynamic> getOfanaType(String type) async {
    final db = await database;
    var res = await db.query(ofanaTable, where: 'type = ?', whereArgs: [type]);
    if(res.length == 0){
      return null;
    }else{
      var resMap = res.toList();
      return resMap.isNotEmpty ? resMap : Null;
    }
  }

  // Future<dynamic> getOfanaAll() async {
  //   final db = await database;
  //   var res = await db.query(ofanaTable);
  //   if(res.length == 0){
  //     return null;
  //   }else{
  //     var resMap = res.toList();
  //     return resMap.isNotEmpty ? resMap : Null;
  //   }
  // }

  Future<void> addOfana(Ofana ofana) async {
    final db = await database;
    final sql = '''INSERT INTO ${DBProvider.ofanaTable}
    (
      ${DBProvider.id},
      ${DBProvider.titre},
      ${DBProvider.vht1},
      ${DBProvider.vht2},
      ${DBProvider.vht3},
      ${DBProvider.type},
      ${DBProvider.sampana},
      ${DBProvider.votoatiny},
      ${DBProvider.isDeleted}
    )
    VALUES (?,?,?,?,?,?,?,?,?)''';
    List<dynamic> params = [ofana.id, ofana.titre, ofana.vht1, ofana.vht1, ofana.vht2, ofana.vht3, ofana.type, ofana.sampana, ofana.votoatiny, ofana.isDeleted ? 1 : 0];
    final result = await db.rawInsert(sql, params);
    // DatabaseCreator.databaseLog('Add ofana', sql, null, result, params);
    DBProvider.databaseLog('Add ofana', sql, null, result);
  }

  addOfanaNew(Ofana ofana) async {
    final db = await database;
    return await db.insert(ofanaTable, ofana.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteOfana(Ofana ofana) async {
    final db = await database;
    final sql = '''UPDATE ${DBProvider.ofanaTable}
    SET ${DBProvider.isDeleted} = 1
    WHERE ${DBProvider.id} = ?
    ''';

    List<dynamic> params = [ofana.id];
    final result = await db.rawUpdate(sql, params);

    // DatabaseCreator.databaseLog('Delete ofana', sql, null, result, params);
    DBProvider.databaseLog('Delete ofana', sql, null, result);
  }

  Future<void> updateOfana(Ofana ofana) async {
    final db = await database;
    final sql = '''UPDATE ${DBProvider.ofanaTable}
    SET ${DBProvider.titre} = ?
    ${DBProvider.vht1} = ?
    ${DBProvider.vht2} = ?
    ${DBProvider.vht3} = ?
    ${DBProvider.type} = ?
    ${DBProvider.sampana} = ?
    ${DBProvider.votoatiny} = ?
    WHERE ${DBProvider.id} = ?
    ''';

    List<dynamic> params = [ofana.titre, ofana.vht1, ofana.vht1, ofana.vht2, ofana.vht3, ofana.type, ofana.sampana, ofana.votoatiny, ofana.id];
    final result = await db.rawUpdate(sql, params);

    // DatabaseCreator.databaseLog('Update Ofana', sql, null, result, params);
    DBProvider.databaseLog('Update Ofana', sql, null, result);
  }

  Future<int> ofanaCount() async {
    final db = await database;
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DBProvider.ofanaTable}''');

    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }

}