import 'package:flutter/material.dart';
import 'package:expense_tracker_new/widgets/expenses.dart';

var kColorScheem =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));

var kDarkColorScheem = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
  brightness: Brightness.dark,
);
void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheem,
        cardTheme: CardTheme().copyWith(
          color: kDarkColorScheem.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheem.primaryContainer,
            foregroundColor: kDarkColorScheem.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: kColorScheem,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheem.onPrimaryContainer,
          foregroundColor: kColorScheem
              .primaryContainer, //because of this APp Bar title has different color
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorScheem.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheem.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheem
                    .onSecondaryContainer, //Because of this Card Title has different colour
                fontSize: 16,
              ),
            ),
      ),
      // themeMode: ThemeMode.system, defalut
      home: Expenses(),
    ),
  );
}
