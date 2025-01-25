import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void showSnackBar(
  String message,
  Color backgroundColor, {
  Color textColor = Colors.white,
  Duration duration = const Duration(seconds: 3),
}) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(message, style: TextStyle(color: textColor)),
      duration: duration,
      backgroundColor: backgroundColor,
    ),
  );
}
