import 'package:flutter/material.dart';

final theme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    color: Colors.black26,
    titleTextStyle: TextStyle(
      fontSize: 24,
      color: Colors.white
    )
  ),
  textTheme: const TextTheme(
    labelLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      color: Colors.white
    ),
    
  ),
  iconTheme: const IconThemeData(
    size: 16,
    color: Colors.white
  )
);
