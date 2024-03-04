import 'package:flutter/material.dart';
import 'package:note_app/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.isLoading});
  final void Function()? onTap;
  final bool isLoading ;
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
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                color: Colors.black,
              )
              : const Text(
                  "Add",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
