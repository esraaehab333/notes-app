import 'package:flutter/material.dart';
import 'package:note_app/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        width: MediaQuery.of(context).size.width,
        // give it a width of the screen
        height: 55,
        child: const Center(
          child: Text(
            "Add",
            style: TextStyle(
                color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
