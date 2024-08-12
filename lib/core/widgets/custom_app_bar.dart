import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.icon, this.onPressed, required this.widget});
  final IconData icon;
  final Function()? onPressed;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          child: IconButton(
            icon: Icon(icon, color: Colors.white),
            onPressed: onPressed,
          ),
        ),
        const Spacer(),
        CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: widget,
        ),
      ],
    );
  }
}
