import 'package:flutter/material.dart';
import 'package:sms/config/app_globals.dart';
import 'package:toastification/toastification.dart';

class ToastHelper {
  static void show({
    required String message,
    ToastificationType type = ToastificationType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final context = navigatorKey.currentContext;
    toastification.show(
      context: context,
      title: Text(message),
      type: type,
      autoCloseDuration: duration,
      alignment: Alignment.topRight,
      animationDuration: const Duration(milliseconds: 300),
      icon: const Icon(Icons.info_outline),
    );
  }
}
