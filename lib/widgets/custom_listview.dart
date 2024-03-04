import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constants/strings.dart';
import 'package:note_app/cubits/add_note_cubit/cubit/notes_cubit_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubitCubit, NotesCubitState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubitCubit>(context).notes??[];
        return Padding(
          padding: EdgeInsets.zero,
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: NoteItem(
                note: notes[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
