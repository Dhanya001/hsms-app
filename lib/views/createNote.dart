import 'package:flutter/material.dart';
import 'package:hsms/SQLite/sqlite.dart';
import 'package:hsms/auth/json_models/notes.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final title=TextEditingController();
  final content=TextEditingController();
  final formkey = GlobalKey<FormState>();

  final db= DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Create Note"),
        actions: [
          IconButton(
              onPressed: () {
            //add note button
            //we should not allow null value
                if(formkey.currentState!.validate()){
                  db
                      .createNote(NoteModel(
                      noteTitle: title.text,
                      noteContent: content.text,
                      createdAt: DateTime.now().toIso8601String()))
                      .whenComplete((){
                    Navigator.of(context).pop(true);
                  });
                }
          }, icon: Icon(Icons.check))
        ],
      ),

      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
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
            ],
          ),
        ),
      ),
    );
  }
}
