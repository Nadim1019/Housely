// lib/core/theme/theme_provider.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Notifier responsible for managing application-wide ThemeMode state.
/// Exposes methods to toggle or set specific light/dark/system themes.
class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  /// Sets explicit theme mode (light, dark, or system default).
  void setThemeMode(ThemeMode mode) {
    if (state != mode) {
      state = mode;
    }
  }

  /// Toggles between light and dark modes explicitly.
  void toggleTheme(bool isDark) {
    state = isDark ? ThemeMode.dark : ThemeMode.light;
  }
}

/// Global Riverpod provider exposing the current ThemeMode notifier.
final themeModeProvider =
NotifierProvider<ThemeModeNotifier, ThemeMode>(ThemeModeNotifier.new);