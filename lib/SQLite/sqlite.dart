import 'package:hsms/auth/json_models/notes.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  final databaseName="notes.db";
  String noteTable="CREATE TABLE notes (noteId INTEGER PRIMARY KEY AUTOINCREMENT,noteTitle TEXT NOT NULL,noteContent TEXT NOT NULL,createdAt TEXT DEFAULT CURRENT_TIMESTAMP)";

  Future<Database>initDB()async{
    final databasePath = await getDatabasesPath();
    final path= join(databasePath,databaseName);

    return openDatabase(path,version: 1,onCreate: (db,version) async{
      await db.execute(noteTable);

    });
  }

  //Create Notes
  Future<int> createNote(NoteModel note) async{
    final Database db= await initDB();
    return db.insert('notes', note.toMap());
  }
  //Get Notes
  Future<List<NoteModel>> getNotes() async{
    final Database db= await initDB();
    List<Map<String, Object?>> result =await db.query('notes');
    return result.map((e)=>NoteModel.fromMap(e)).toList();

  }
  //Update Notes
  Future<int> deleteNote(int id) async{
    final Database db= await initDB();
    return db.delete('notes', where: 'noteId=?',whereArgs: [id]);
  }
  //Delete Notes
  Future<int> updateNote(title,content, noteId) async{
    final Database db= await initDB();
    return db.rawUpdate('update notes set noteTitle=?,noteContent=?,where noteId=?',[title,content,noteId]);
  }

}