// import 'package:kit_ofana/models/ofana.dart';
// import 'package:kit_ofana/db/database.dart';

// class RepositoryServiceOfana {

//   static Future<List<Ofana>> getAllOfana() async {
//     final sql = '''SELECT * FROM ${DBProvider.ofanaTable}
//     WHERE ${DBProvider.isDeleted} = 0''';

//     final data = await db.rawQuery(sql);

//     List<Ofana> ofanas = List();

//     for (final node in data) {
//       final ofana = Ofana.fromJson(node);
//       ofanas.add(ofana);
//     }
//     return ofanas;
//   }

//   static Future<Ofana> getOfana(int id) async {
//     //final sql = '''SELECT * FROM ${DatabaseCreator.ofanaTable}
//     //WHERE ${DatabaseCreator.id} = $id''';
//     //final data = await db.rawQuery(sql);

//     final sql = '''SELECT * FROM ${DBProvider.ofanaTable}
//     WHERE ${DBProvider.id} = ?''';

//     List<dynamic> params = [id];
//     final data = await db.rawQuery(sql, params);

//     final ofana = Ofana.fromJson(data.first);
//     return ofana;
//   }

//   static Future<void> addOfana(Ofana ofana) async {
//     // final sql = '''INSERT INTO ${DatabaseCreator.ofanaTable}
//     // (
//     //   ${DatabaseCreator.id},
//     //   ${DatabaseCreator.titre},
//     //   ${DatabaseCreator.vht1},
//     //   ${DatabaseCreator.vht2},
//     //   ${DatabaseCreator.vht3},
//     //   ${DatabaseCreator.type},
//     //   ${DatabaseCreator.sampana},
//     //   ${DatabaseCreator.votoatiny},
//     //   ${DatabaseCreator.isDeleted}
//     // )
//     // VALUES 
//     // (
//     //   ${ofana.id},
//     //   "${ofana.titre}",
//     //   "${ofana.vht1}",
//     //   "${ofana.vht2}",
//     //   "${ofana.vht3}",
//     //   "${ofana.type}",
//     //   "${ofana.sampana}",
//     //   "${ofana.votoatiny}",
//     //   ${ofana.isDeleted ? 1 : 0}
//     // )''';

//     final sql = '''INSERT INTO ${DBProvider.ofanaTable}
//     (
//       ${DBProvider.id},
//       ${DBProvider.titre},
//       ${DBProvider.vht1},
//       ${DBProvider.vht2},
//       ${DBProvider.vht3},
//       ${DBProvider.type},
//       ${DBProvider.sampana},
//       ${DBProvider.votoatiny},
//       ${DBProvider.isDeleted}
//     )
//     VALUES (?,?,?,?,?,?,?,?,?)''';
//     List<dynamic> params = [ofana.id, ofana.titre, ofana.vht1, ofana.vht1, ofana.vht2, ofana.vht3, ofana.type, ofana.sampana, ofana.votoatiny, ofana.isDeleted ? 1 : 0];
//     final result = await db.rawInsert(sql, params);
//     // DatabaseCreator.databaseLog('Add ofana', sql, null, result, params);
//     DBProvider.databaseLog('Add ofana', sql, null, result);
//   }

//   static Future<void> deleteOfana(Ofana ofana) async {
//     /*final sql = '''UPDATE ${DatabaseCreator.ofanaTable}
//     SET ${DatabaseCreator.isDeleted} = 1
//     WHERE ${DatabaseCreator.id} = ${ofana.id}
//     ''';*/

//     final sql = '''UPDATE ${DBProvider.ofanaTable}
//     SET ${DBProvider.isDeleted} = 1
//     WHERE ${DBProvider.id} = ?
//     ''';

//     List<dynamic> params = [ofana.id];
//     final result = await db.rawUpdate(sql, params);

//     // DatabaseCreator.databaseLog('Delete ofana', sql, null, result, params);
//     DBProvider.databaseLog('Delete ofana', sql, null, result);
//   }

//   static Future<void> updateOfana(Ofana ofana) async {
//     /*final sql = '''UPDATE ${DatabaseCreator.ofanaTable}
//     SET ${DatabaseCreator.titre} = "${ofana.titre}"
//     WHERE ${DatabaseCreator.id} = ${ofana.id}
//     ''';*/

//     final sql = '''UPDATE ${DBProvider.ofanaTable}
//     SET ${DBProvider.titre} = ?
//     ${DBProvider.vht1} = ?
//     ${DBProvider.vht2} = ?
//     ${DBProvider.vht3} = ?
//     ${DBProvider.type} = ?
//     ${DBProvider.sampana} = ?
//     ${DBProvider.votoatiny} = ?
//     WHERE ${DBProvider.id} = ?
//     ''';

//     List<dynamic> params = [ofana.titre, ofana.vht1, ofana.vht1, ofana.vht2, ofana.vht3, ofana.type, ofana.sampana, ofana.votoatiny, ofana.id];
//     final result = await db.rawUpdate(sql, params);

//     // DatabaseCreator.databaseLog('Update Ofana', sql, null, result, params);
//     DBProvider.databaseLog('Update Ofana', sql, null, result);
//   }

//   static Future<int> ofanaCount() async {
//     final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DBProvider.ofanaTable}''');

//     int count = data[0].values.elementAt(0);
//     // int count = 1;
//     int idForNewItem = count++;
//     return idForNewItem;
//   }
// }