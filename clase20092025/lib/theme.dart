import 'package:flutter/material.dart';

class AppTheme {
  static final mainTheme = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.black,
      secondary: Colors.yellow[700],
      background: Colors.black,
      error: Colors.red,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
        color: Colors.yellow,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.yellow),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.yellow,       // Fondo amarillo
      selectedItemColor: Colors.black,      // Ítem activo → negro
      unselectedItemColor: Colors.white,    // Ítems inactivos → blanco
    ),
  );
}
