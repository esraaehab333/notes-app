import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/cubit/notes_cubit_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteView(
            note:note
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    note.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    note.subTitle,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 16,
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    size: 25,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  note.date,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
