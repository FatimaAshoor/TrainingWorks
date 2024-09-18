import '../db/sql_db.dart';
import '../model/note_model.dart';

class NoteService{

  Future<List<NoteModel>> loadNotes() async {
    SqlDb sqlDb = SqlDb();
    return await sqlDb.readData("SELECT * FROM note;");
  }

  Future<List<NoteModel>> showNote(NoteModel noteModel) async {
    SqlDb sqlDb = SqlDb();
    return await sqlDb.readData("SELECT * FROM note WHERE id = ${noteModel.id};");
  }

  Future<int> addNote(NoteModel noteModel) async {
    if (noteModel.title == null || noteModel.content == null) {
      throw Exception("Title and content cannot be null");
    }
    SqlDb sqlDb = SqlDb();
    print("in SQL DB: title is ${noteModel.title}, AND CONTENT is ${noteModel.content}");
    return await sqlDb.insertData("INSERT INTO note (title, content) VALUES (?, ?)",noteModel);
  }

  Future<int> updateNote(NoteModel noteModel) async {
    SqlDb sqlDb = SqlDb();
    return await sqlDb.updateData(noteModel);
  }

  Future<int> deleteNote(NoteModel noteModel) async {
    SqlDb sqlDb = SqlDb();
    return await sqlDb.deleteData(noteModel);
  }

}