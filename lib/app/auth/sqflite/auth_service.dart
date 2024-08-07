import 'package:flutter_application_3/app/auth/model/auth_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserService {
  //تعريف متغير قاعدة البيانات sqflite
  Database? database;
  //تعريف متغير قاعدة البيانات sqflite

// انشاء قاعدة البيانات والجدول ﻷول مره فقط عند تنصيب التطبيق وبعد ذلك يتم استخدامها فقط
  createDatabase() async {
    final String databasePath = await getDatabasesPath();
    const String databaseName = 'users.db';
    final databasePathFull = join(databasePath, databaseName);

    database = await openDatabase(
      databasePathFull,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT UNIQUE NOT NULL,location TEXT,firstname TEXT ,lastname TEXT, password TEXT NOT NULL)');
      },
    );
  }
// انشاء قاعدة البيانات والجدول ﻷول مره فقط عند تنصيب التطبيق وبعد ذلك يتم استخدامها فقط

// إغلاق قاعدة البيانات بعد الستخدامها
  Future<void> closeDatabase() async {
    await database!.close();
  }
// إغلاق قاعدة البيانات بعد الستخدامها

  /// ******************************************************
// ميثود يتم استخدامها للأتي
// 1. فتح قاعدة البيانات
//2. تسجيل المستخدم الجديد
// 3.اغلاق قاعدة البيانات
  Future<void> createUser(AuthModel user) async {
    await createDatabase();
    await database!.insert('users', user.toMap());
    await closeDatabase();
  }

  /// ******************************************************

  ///*********************************************************** */
  ///ميثود تقوم بجلب بيانات المستخدم بحسب الايميل وتقوم بأرجاع بيانات من نوع AuthModel ?
  /// 1. فتح قاعدة البيانات
  /// 2. 1. تم تعريف ليست من نوع ماب  string,dynamic
  /// 2. 2. يتم تحميل البينات الايميل المدخل بناء علي email المرسل في حين ان وجدت
  /// 3. اغلاق قاعدة البينات
  /// 4. عمل تحليل لبيانات map
  /// 5. في حين عدم وجود الايميل المدخل سيتم  ارجاع قيمة null
  /// 6. في حين وجدت البيانات سيقوم بأرجاع بيانات المستخدم كاملة
  Future<AuthModel?> getUserByEmail(String email) async {
    await createDatabase();
    final List<Map<String, dynamic>> results =
        await database!.query('users', where: 'email = ?', whereArgs: [email]);
    await closeDatabase();

    if (results.isEmpty) {
      return null;
    } else {
      return AuthModel.fromMap(results.first);
    }
  }

  ///*********************************************************** */

  ///*********************************************************** */
//ميثود تسجيل الدخول بناء علي الايميل والباسورد
//1. فتح قاعدة بالبيانات
//2. تعريف ليست من نوع map<String,dynamic>
//3. يتم تحليل بيانات الداتا بيز في حين وجود هذا الاسم وكلمة المرور
//3.1 سيتم تحميل البيانات الي الليست
//3.2 ستكون الليست فارغة
//4 بناء علي السابق سيتم ارجاع قيمة true  او false لتسجيل الدخول
  Future<bool> authenticateUser(String email, String password) async {
    await createDatabase();
    final List<Map<String, dynamic>> results = await database!.query('users',
        where: 'email = ? AND password = ?', whereArgs: [email, password]);
    await closeDatabase();

    return results.isNotEmpty;
  }

//Method Update Password
  Future<void> updateUserData(AuthModel updatedModel, String email) async {
    await createDatabase();
    await database!.update(
      'users',
      updatedModel.toMap(),
      where: 'email = ?',
      whereArgs: [email],
    );
    await closeDatabase();
  }
}
