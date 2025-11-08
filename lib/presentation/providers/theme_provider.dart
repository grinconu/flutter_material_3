import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//final isDarkModeProvider = StateProvider<bool>((ref) => false);

//final currentColorProvider = StateProvider<int>((ref) => 0);

//Provider immutable
final listColorsProvider = Provider((ref) => colors);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColor(int color) {
    state = state.copyWith(selectedColor: color);
  }
}
