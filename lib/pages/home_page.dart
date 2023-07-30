import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx/controllars/note_controllar.dart';
import 'package:getx/pages/show_note_page.dart';
import 'note_ write_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  NoteController noteContriller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await (showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Confirmation"),
              content: Text("Are you suru exit."),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.lightGreen)),
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text(
                          "No",
                          style: TextStyle(color: Colors.black),
                        )),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.lightGreen)),
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child:
                            Text("Yes", style: TextStyle(color: Colors.black))),
                  ],
                )
              ],
            );
          },
        ));
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("NotePad"),
            leading: Icon(Icons.book),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Get.to(() => NoteWritePAge());
            },
          ),
          body: GetBuilder<NoteController>(
            builder: (controller) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.noteList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        noteContriller.showNote(
                            controller.noteList[index].noteTitle.toString(),
                            controller.noteList[index].noteText.toString());
                        Get.to(() => ShowNotePage());
                      },
                      tileColor: Colors.lightGreen,
                      title: Text(
                        controller.noteList[index].noteTitle.toString(),
                      ),
                      subtitle:
                          Text(DateTime.now().toString().substring(0, 16)),
                      trailing: InkWell(
                        onTap: () {
                          noteContriller.delet(index);
                        },
                        child: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
