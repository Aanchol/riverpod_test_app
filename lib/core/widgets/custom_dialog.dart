import 'package:flutter/material.dart';

class CustomDialog {
  static Future<T?> show<T>({
    required BuildContext context,
    String? title,
    String? message,
    Widget? content,
    String confirmText = 'OK',
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          title: title != null ? Text(title) : null,
          content: content ?? (message != null ? Text(message) : null),
          actions: [
            if (cancelText != null)
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onCancel?.call();
                },
                child: Text(cancelText),
              ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                onConfirm?.call();
              },
              child: Text(confirmText),
            ),
          ],
        );
      },
    );
  }
}
