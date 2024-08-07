import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'alein.db');
    //هون عم يرجعلي ل path مسار الالداتابيز مع اسمها مشان انش~ها
    Database mydb = await openDatabase(path,
        onCreate: _onCreat, version: 4, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database, int oldversion, int newversion) async {
    print("onupgrade====================================");
  }

  _onCreat(Database db, int version) async {
    Batch batch = db.batch();
    // تستخدم ل انشاء الجداول
    batch.execute('''
CEREATE TABLE "Sign up"(
  email TEXT PRIMARY KEY  NOT NULL ,
  password TEXT NOT NULL,


)
''');
    batch.execute('''
CEREATE TABLE "Login"(
  firstname Text   NOT NULL  ,
  lastname TEXT NOT NULL,
  location TEXT NOT NUlL,
  password TEXT NOT NULL,


)
''');
    await batch.commit();

    readData(String sql) async {
      var db;
      Database? mydb = await db;
      List<Map> response = await mydb!.rawQuery(sql);
      return response;
    }

    insertData(String sql) async {
      var db;
      Database? mydb = await db;
      int response = await mydb!.rawInsert(sql);
      return response;
    }

    updateData(String sql) async {
      var db;
      Database? mydb = await db;
      int response = await mydb!.rawUpdate(sql);
      return response;
    }

    deletData(String sql) async {
      var db;
      Database? mydb = await db;
      int response = await mydb!.rawDelete(sql);
      return response;
    }

    mydeleteDatabase() async {
      String databasepath = await getDatabasesPath();
      String path = join(databasepath, 'alein.db');
      await deleteDatabase(path);
    }

    read(String table) async {
      var db;
      Database? mydb = await db;
      List<Map> response = await mydb!.query(table);
      return response;
    }

    insert(String table, Map<String, Object?> values) async {
      var db;
      Database? mydb = await db;
      int response = await mydb!.insert(table, values);
      return response;
    }

    update(String table, Map<String, Object?> value, String? mywhere) async {
      var db;
      Database? mydb = await db;
      int response = await mydb!.update(table, value, where: mywhere);
      return response;
    }

    delet(String table, String? mywhere) async {
      var db;
      Database? mydb = await db;
      int response = await mydb!.delete(table, where: mywhere);
      return response;
    }
  }

  read(String s) {}

  insert(String s, Map map) {}

  delete(String s, String t) {}

  readData(String s) {}

  insertData(String s) {}

  update(String s, Map<String, String> map, String t) {}
}
