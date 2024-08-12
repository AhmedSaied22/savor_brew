import 'package:flutter/material.dart';

class NavigateModel {
  final String text;
  final Widget screen;
  final IconData icon;
  const NavigateModel({
    required this.text,
    required this.screen,
    required this.icon,
  });
}
