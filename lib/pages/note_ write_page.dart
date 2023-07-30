import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/models/note_model.dart';
import '../controllars/note_controllar.dart';
import 'home_page.dart';

// ignore: must_be_immutable
class NoteWritePAge extends StatelessWidget {
  NoteWritePAge({super.key});

  NoteController noteContriller = Get.put(NoteController());
  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("NotePad"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 50),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: "Note Title",
                    hintStyle: TextStyle(color: Colors.black),
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey)),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  maxLines: 10,
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: "Note Text",
                    hintStyle: TextStyle(color: Colors.black),
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey)),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      noteContriller.saveButton(
                        NoteModel(
                            noteTitle: titleController.text,
                            noteText: textController.text),
                      );

                      Get.to(() => HomePage());
                    },
                    child: Text("Save"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
