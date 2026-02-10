import 'package:flutter/material.dart';
import 'widgets/expenses.dart';

var KColorsScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var KDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: KDarkColorScheme,
        cardTheme: const CardThemeData().copyWith(
          color: KDarkColorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: KDarkColorScheme.primaryContainer,
            foregroundColor: KDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: KColorsScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: KColorsScheme.onPrimaryContainer,
          foregroundColor: KColorsScheme.primaryContainer,
        ),
        cardTheme: const CardThemeData().copyWith(
          color: KColorsScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: KColorsScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: KColorsScheme.onSecondaryContainer,
                  fontSize: 16),
            ),
      ),
      //themeMode: ThemeMode.system, //default
      home: const Expenses(),
    ),
  );
}
