import 'dart:async';
import 'package:turtle_game/database/sqflite/database/database.dart';

class DataBaseDao {
  final dbProvider = DatabaseProvider.dbProvider;

  // Future<int> insertCase(CasesModel casesModel) async {
  //   final db = await dbProvider.database;
  //   final re = db.insert(TABLE_CASES, casesModel.toJson(),
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  //   return re;
  // }

//Delete
  Future<int> deleteAllCases() async {
    final db = await dbProvider.database;
    var result = await db.delete(TABLE_CASES);
    return result;
  }

//Delete
//   Future<CasesModel> getAllCases() async {
//     final db = await dbProvider.database;
//     var result = await db.query(TABLE_CASES);
//     return CasesModel.fromJson(result.first);
//   }
//
// //We are not going to use this in the demo
// Future deleteAllTodos() async {
//   final db = await dbProvider.database;
//   var result = await db.delete(
//     TABLE_CONVERSATION_INFO,
//   );
//
//   return result;
// }
}
