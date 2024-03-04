import 'package:flutter/material.dart';
import 'package:note_app/constants/colors.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key, required this.hint, this.maxLines = 1, this.onSaved , this.onchange});
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchange,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is required";
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: kPrimaryColor),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
