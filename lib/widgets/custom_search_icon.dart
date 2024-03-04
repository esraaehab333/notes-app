// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({
    Key? key,
    required this.icon, this.onPreesed,
  }) : super(key: key);
  final void Function()? onPreesed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            16,
          ),
        ),
      ),
      child: IconButton(
        onPressed: onPreesed,
        icon: Icon(
          icon,
          size: 28,
        ),
      ),
    );
  }
}
