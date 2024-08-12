import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged,
      this.controller,
      this.onSubmitted,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixIcon,
      this.focusNode,
      this.keyboardType,
      this.labelText});
  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final bool obscureText;
  final IconButton? suffixIcon;
  final FocusNode? focusNode;
  final IconData? prefixIcon;
  final String? labelText;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onFieldSubmitted: onSubmitted,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onSaved: onSaved,
      focusNode: focusNode,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return ' $hintText is required';
        } else {
          return null;
        }
      },
      cursorColor: Colors.black,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(0.0),
          child: suffixIcon,
        ),
        isDense: true,
        contentPadding:
            const EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 12),
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.5), fontWeight: FontWeight.w400),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(2),
    );
  }
}
