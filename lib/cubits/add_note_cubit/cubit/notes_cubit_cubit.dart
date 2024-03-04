import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants/strings.dart';
import 'package:note_app/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());
  List<NoteModel>? notes;
  fetchAllNotes() {
    var notesbox = Hive.box<NoteModel>(KNoteBox);
    notes = notesbox.values.toList();
    emit(NotesCubitSuccess());
  }
}
/**import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants/strings.dart';
import 'package:note_app/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());
  
  fetchAllNotes() {
    // ignore: unused_local_variable
    var notesbox = Hive.box<NoteModel>(KNoteBox);
  }
}
 */