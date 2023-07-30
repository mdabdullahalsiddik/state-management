import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllars/note_controllar.dart';

// ignore: must_be_immutable
class ShowNotePage extends StatelessWidget {
  ShowNotePage({super.key});

  NoteController noteContriller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(noteContriller.showtitle.toString()),
                  )),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.all(5),
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Text(noteContriller.showtext.toString()))),
            ],
          ),
        ),
      ),
    );
  }
}
