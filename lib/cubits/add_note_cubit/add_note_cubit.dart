import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants/strings.dart';
import 'package:note_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color? color =  const Color(0xffFFC09F);

  addNote(NoteModel note) async {
    note.color = color!.value;
    emit(AddNoteLoading());
    try {
      var notesbox = Hive.box<NoteModel>(KNoteBox);

      await notesbox.add(note);
      emit(AddNoteSucess());
      print(notesbox.length);
    } catch (e) {
      emit(AddNotefailure(e.toString()));
    }
  }
}
