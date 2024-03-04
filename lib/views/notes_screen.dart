import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/cubit/notes_cubit_cubit.dart';
import 'package:note_app/widgets/add_note_bottom_model_sheet.dart';
import 'package:note_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)),
            context: context,
            builder: (context) {
              return const AddNoteBottomSheet();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}
