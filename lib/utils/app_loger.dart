import 'package:flutter/foundation.dart';

class AppLogger {
  static get logger => null;

  static void info({dynamic message}) {
    debugPrint("ℹ️ ---- CART LIST ---- →");
    debugPrint("ℹ️ ---- Item ---- → $message");
  }

  static void success(String message) {
    debugPrint("✅ SUCCESS → $message");
  }

  static void warning(String message) {
    debugPrint("⚠️ WARNING → $message");
  }

  static void error( message) {
    debugPrint(
      "Qty::: $message",
    );
  }

  static void divider() {
    debugPrint("────────────────────────────────");
  }
}
