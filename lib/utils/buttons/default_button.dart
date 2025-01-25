import 'package:flutter/material.dart';

ElevatedButton defaultButton(
  BuildContext context,
  void Function() action,
  Color backgroundColor, {
  String? text,
  Icon? icon,
  double? width,
  double borderRadius = 0,
}) {
  return ElevatedButton(
    onPressed: action,
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
    ),
    child: width != null
        ? Container(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (text != null)
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                if (text != null && icon != null) const SizedBox(width: 4),
                if (icon != null)
                  Icon(
                    icon.icon,
                    color: icon.color,
                    size: icon.size,
                  ),
              ],
            ),
          )
        : IntrinsicWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (text != null)
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                if (text != null && icon != null) const SizedBox(width: 4),
                if (icon != null)
                  Icon(
                    icon.icon,
                    color: icon.color,
                    size: icon.size,
                  ),
              ],
            ),
          ),
  );
}
