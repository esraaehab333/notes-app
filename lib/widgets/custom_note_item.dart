import 'package:flutter/material.dart';
import 'package:note_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const EditNoteView();
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    "Flutter Tips",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    "bulid your career with that esraa ehab",
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
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  "May 21 , 2022",
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
