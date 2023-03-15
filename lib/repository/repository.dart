import 'package:meu_sorteio/db/db.dart';
import 'package:meu_sorteio/model/random_number_model.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  static const String tableName = 'history2';

  late Database db;
  List<RandomNumberModel> numberList = [];

  Future<List<RandomNumberModel>> readResults() async {
    db = await Db.instance.database;
    List list = await db.rawQuery('SELECT * FROM $tableName');

    for (var item in list) {
      RandomNumberModel test = RandomNumberModel.fromMap(item);
      numberList.add(test);
    }
    return numberList;
  }

  insertResults(RandomNumberModel numberModel) async {
    db = await Db.instance.database;
    db.insert(tableName, numberModel.toMap());
  }

  clearResults() async {
    db = await Db.instance.database;
    db.delete(tableName);
    readResults();
  }
}
