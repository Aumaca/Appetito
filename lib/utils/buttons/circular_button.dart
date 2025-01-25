import 'package:flutter/material.dart';

ElevatedButton circularButton(
  BuildContext context,
  void Function() action,
  Color backgroundColor,
  Icon icon, {
  double size = 10,
}) {
  return ElevatedButton(
    onPressed: action,
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      shape: const CircleBorder(),
      padding: EdgeInsets.all(size / 2),
    ),
    child: Icon(
      icon.icon,
      color: icon.color,
      size: icon.size,
    ),
  );
}
