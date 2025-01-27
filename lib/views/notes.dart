import 'package:flutter/material.dart';
import 'package:hsms/SQLite/sqlite.dart';
import 'package:hsms/auth/json_models/notes.dart';
import 'package:hsms/views/createNote.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';


class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  late DatabaseHelper handler;
  late Future<List<NoteModel>> notes;

  final db=DatabaseHelper();
  final title=TextEditingController();
  final content=TextEditingController();

  @override
  void initState() {
    handler=DatabaseHelper();
    notes=handler.getNotes();

    handler.initDB().whenComplete((){
      notes=getAllNotes();
    });
    super.initState();
  }

  Future<List<NoteModel>> getAllNotes(){
    return handler.getNotes();
  }

  //Refresh method
  Future<void> _refresh() async {
    setState(() {
      notes=getAllNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //we need call refresh method after a new note created.
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>const CreateNote()))
              .then((value){
            if(value){
              _refresh();
            }
          });


      },
        child: const Icon(Icons.add),
      ),
      //First we are going to show notes

      body: FutureBuilder<List<NoteModel>>(
        future: notes,
        builder: (BuildContext context, AsyncSnapshot<List<NoteModel>>snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const CircularProgressIndicator();
          }else if(snapshot.hasData && snapshot.data!.isEmpty){
            return const Center(child: Text("No data"));
          }else if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }else{
            final items=snapshot.data ??<NoteModel>[];
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context,index){
            return ListTile(
              subtitle: Text(DateFormat("yMd").format(DateTime.parse(items[index].createdAt))),
              title: Text(items[index].noteTitle),
              trailing: IconButton(
                  icon: const Icon(Icons.delete),
              onPressed: () {
                    //we call delete method
                db.deleteNote(items[index].noteId!)
                    .whenComplete((){
                   //after delete Refresh notes
                  _refresh();
                });
              },),
              onTap: () {
                //when we click on note
                setState(() {
                  title.text=items[index].noteTitle;
                  content.text=items[index].noteContent;
                });
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    actions: [
                      Row(
                        children: [
                          TextButton(onPressed: () {
                            //now update method
                            db.updateNote(title.text, content.text, items[index].noteId)
                              .whenComplete((){
                                _refresh();
                                Navigator.pop(context);
                            });
                          },
                            child: Text("Update"),
                          ),

                          TextButton(onPressed: () {
                            Navigator.pop(context);
                          },
                            child: Text("Cancel"),
                          ),
                        ],
                      ),
                    ],
                    title: Text("Update Note"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //we need two text field
                        TextFormField(
                          controller: title,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Title is required.";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            label: Text('title'),
                          ),
                        ),

                        TextFormField(
                          controller: content,
                          validator: (value){
                            if(value!.isEmpty){
                              return "content is required.";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            label: Text('content'),
                          ),
                        ),
                    ],),
                  );
                });
              },
            );
            });
          }

        },
      ),
    );
  }
}
