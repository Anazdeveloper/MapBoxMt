import 'package:flutter/material.dart';

class CustomPopup {
  final Widget popup;
  CustomPopup({required this.popup});

  show(BuildContext context) {
    showDialog(context: context, builder: (context) =>popup);
  }
}