import 'package:get/get.dart';
import 'package:getx/models/note_model.dart';

class NoteController extends GetxController {
  List<NoteModel> noteList = [];
  String? showtitle;
  String? showtext;
  String? time;

  void saveButton(NoteModel data) {
    noteList.add(data);
    update();
  }

  void showNote(Title, Text) {
    showtitle = Title;
    showtext = Text;
  }

  void delet(index) {
    noteList.removeAt(index);
    update();
  }
}
