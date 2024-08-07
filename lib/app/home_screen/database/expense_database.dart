import 'package:flutter_application_3/app/home_screen/expense_model/expense_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../../main.dart';

class ExpenseDataBase {
  Database? database;

  /**----------------Create Database Expense ----------------------------------------------------------------------------------------------------------------- */
  createDatabase() async {
    final String databbasePath = await getDatabasesPath();
    String databaseName = '${Profile.email}.db';
    final databasePathFull = join(databbasePath, databaseName);
    database = await openDatabase(
      databasePathFull,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE expense (id INTEGER PRIMARY KEY AUTOINCREMENT,details TEXT,count TEXT,price TEXT,category TEXT,datetime TEXT,time TEXT)");
      },
    );
  }

  /**-------------------------------Create Database Expense -------------------------------------------------------------------------------------------------------- */
  /**-------------------------------Close Database Expense-------------------------------------------------------------------------------------------------------- */
  Future<void> closeDatabase() async {
    await database!.close();
  }
  /**-------------------------------Close Database Expense-------------------------------------------------------------------------------------------------------- */

/**-------------------------------Add Expense To DataBase-------------------------------------------------------------------------------------------------------- */
  Future<void> addExpenseToDatabase(ExpenseModel expense) async {
    await createDatabase();
    await database!.insert("expense", expense.toMap());
    await closeDatabase();
    print(
        "/***********Add Expense Is Success*********************************/");
  }

/**-------------------------------Add Expense To DataBase-------------------------------------------------------------------------------------------------------- */

/**********Get Data From Database */
  Future<List<ExpenseModel>> getExpenses() async {
    await createDatabase();
    final result = await database!.query('expense');

    return result.map((map) => ExpenseModel.fromMap(map)).toList();
  }
  /**********Get Data From Database */

  /**------------------------Get Data With Category------------------------ */
  Future<List<ExpenseModel>> getDateWithCategory(String category) async {
    await createDatabase();
    print("test");
    final results = await database!
        .query('expense', where: 'category=?', whereArgs: [category]);
    print("results.length");
    return results.map((e) => ExpenseModel.fromMap(e)).toList();
  }

  /**------------------------Get Data With Category------------------------ */
  /**------------------------Get Data With Category------------------------ */
  Future<List<ExpenseModel>> getDateWithDate(String date) async {
    await createDatabase();

    final results = await database!
        .query('expense', where: 'dateTime=?', whereArgs: [date]);

    return results.map((e) => ExpenseModel.fromMap(e)).toList();
  }

  /**------------------------Get Data With Category------------------------ */
  Future<int> deleteDataWithId(int id) async {
    await createDatabase();

    final results =
        await database!.delete('expense', where: 'id=?', whereArgs: [id]);
    print(results);
    return results;
  }
}
