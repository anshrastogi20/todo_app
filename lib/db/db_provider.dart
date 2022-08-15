import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/modals/task.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider database = DBProvider._();
  static Database? _database;

  Future<Database?> get databaseGetter async {
    if (_database!=null){
      return _database;
    }
    else{
      _database = await initDatabase();
      return _database;
    }
  }
   initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'todo_app_db.db'),
      onCreate:  (db,version) async {
        await db.execute('''
        CREATE TABLE tasks (title TEXT, check TEXT)
        ''');
      },
      version: 1
    );
   }

  addNewTaskdb(Task newTask) async{
    final db = await databaseGetter;
    db?.insert('tasks', newTask.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<dynamic> getTask() async{
    final db = await databaseGetter;
    var res = await db?.query('tasks');
    if  (res?.length==0){
      return null;
    }
    else{
      var resultMap = res?.toList();
      return resultMap;
    }
  }
}