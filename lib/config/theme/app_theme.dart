import 'package:flutter/material.dart';

const colors = <Color>[
  Colors.red,
  Colors.blue,
  Colors.orange,
  Colors.purple,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
    : assert(selectedColor >= 0, 'Selected color must be grater than 0'),
      assert(
        selectedColor < colors.length,
        'Selected color must be less than ${colors.length - 1}',
      );

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: colors[selectedColor],
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    appBarTheme: AppBarTheme(centerTitle: false),
  );

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode,
  );
}
