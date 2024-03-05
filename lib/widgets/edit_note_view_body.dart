import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/cubits/add_note_cubit/cubit/notes_cubit_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_add_note_form_state.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_text_filed.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(children: [
        const SizedBox(
          height: 50,
        ),
        CustomAppBar(
          onPreesed: () {
            widget.note.title = title ?? widget.note.title;
            widget.note.subTitle = content ?? widget.note.subTitle;
            widget.note.save();
            BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          },
          title: 'Edit Note',
          icon: Icons.check,
        ),
        const SizedBox(
          height: 50,
        ),
        CustomTextFiled(
            onchange: (value) {
              title = value;
            },
            hint: widget.note.title),
        const SizedBox(
          height: 16,
        ),
        CustomTextFiled(
          onchange: (value) {
            content = value;
          },
          hint: widget.note.subTitle,
          maxLines: 5,
        ),
        EditColorsList(
          note: widget.note,
        ),
      ]),
    );
  }
}

class EditColorsList extends StatefulWidget {
  const EditColorsList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditColorsList> createState() => _EditColorsListState();
}

class _EditColorsListState extends State<EditColorsList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = Kcolors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: Kcolors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.note.color = Kcolors[index].value;
              setState(() {});
            },
            child: ColorItem(
              isSelected: currentIndex == index,
              color: Kcolors[index],
            ),
          ),
        ),
      ),
    );
  }
}
