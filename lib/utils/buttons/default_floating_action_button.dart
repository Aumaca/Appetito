import 'package:flutter/material.dart';

FloatingActionButton defaultFloatingActionButton(
    void Function() action, Color backgroundColor, IconData icon) {
  return FloatingActionButton(
    onPressed: action,
    elevation: 0,
    backgroundColor: backgroundColor,
    child: Icon(
      icon,
      color: Colors.white,
      size: 32,
    ),
  );
}
