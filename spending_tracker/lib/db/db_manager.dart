// ignore_for_file: constant_identifier_names
import 'package:flutter/services.dart';
import '../models/single_expense_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'single_expense_dto.dart';

class DBManager {
  static const String DATABASE_FILENAME = 'expenses.sqlite3.db';
  static const SCHEMA_PATH = 'assets/schema.txt';
  static const String SQL_CREATE_SCHEMA =
      'CREATE TABLE IF NOT EXISTS expense_entries';
  static const String SQL_INSERT =
      'INSERT INTO expense_entries(amount, date) VALUES(?, ?);';
  static const SQL_SELECT = 'SELECT * FROM expense_entries';

  static DBManager? _instance;
  final Database db;
  DBManager._({required Database database}) : db = database;

  factory DBManager.getInstance() {
    assert(_instance != null);
    return _instance as DBManager;
  }

  static Future initialize() async {
    String schema = await _loadSchema();
    final Database db = await openDatabase(join(DATABASE_FILENAME), version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(schema);
    });
    _instance = DBManager._(database: db);
  }

  static Future<String> _loadSchema() async {
    return await rootBundle.loadString(SCHEMA_PATH);
  }

  void createExpenseEntry({required SingleExpenseDTO singleExpenseDTO}) {
    db.transaction((txn) async {
      await txn.rawInsert(SQL_INSERT,
          [singleExpenseDTO.amount, singleExpenseDTO.date.toString()]);
    });
  }

  Future<List<SingleExpenseModel>> readExpenseEntries() async {
    List<Map> expenseRecords = await db.rawQuery(SQL_SELECT);
    return expenseRecords
        .map<SingleExpenseModel>((record) => SingleExpenseModel(
            amount: record['amount'], date: DateTime.parse(record['date'])))
        .toList();
  }
}
