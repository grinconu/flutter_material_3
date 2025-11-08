import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Changer'),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(listColorsProvider);
    final currentColor = ref.watch(themeNotifierProvider).selectedColor;

    return RadioGroup(
      groupValue: currentColor,
      onChanged: (value) {
        if (value == null) return;
        ref.read(themeNotifierProvider.notifier).changeColor(value);
      },
      child: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (builder, index) {
          final color = colors[index];
          return RadioListTile(
            value: index,
            activeColor: color,
            title: Row(
              children: [
                Container(height: 20, width: 20, color: color),
                Text(' Color ${color.toARGB32()} '),
              ],
            ),
          );
        },
      ),
    );
  }
}
