// lib/theme.dart

import 'package:flutter/material.dart';

class AppTheme {
  // Define tu color naranja de acento para fácil referencia
  static const Color _accentOrange = Color(0xFFE89F20);

  static final mainTheme = ThemeData(
    // ----------------------------------------------------
    // PROPIEDADES BASE Y COLOR DE FONDO
    // ----------------------------------------------------
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,

    // ----------------------------------------------------
    // ESQUEMA DE COLORES (COLOR SCHEME)
    // ----------------------------------------------------
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
    ).copyWith(
      primary: Colors.black,
      secondary: _accentOrange, // Tu color NARANJA
      background: Colors.black,
      error: Colors.red,
    ),

    // ----------------------------------------------------
    // BARRA DE APLICACIÓN (APPBAR) - Se aplica a la barra superior
    // ----------------------------------------------------
    appBarTheme: const AppBarTheme(
      // 🚨 FONDO: NARANJA (para la barra superior, donde vive el TabBar)
      backgroundColor: _accentOrange,

      // 🚨 ÍCONOS (Botón de menú, flecha de regreso, etc.): NEGRO
      iconTheme: IconThemeData(color: Colors.black),

      // 🚨 TÍTULO (ej. 'DPL'): NEGRO
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    // ----------------------------------------------------
    // BARRA DE PESTAÑAS (TAB BAR THEME) - Se aplica al TabBar
    // ----------------------------------------------------
    tabBarTheme: const TabBarThemeData( // ⬅️ CAMBIADO DE 'TabBarTheme' a 'TabBarThemeData'
      // 🚨 COLOR DE ETIQUETA ACTIVA (texto/icono): NEGRO
      labelColor: Colors.black,

      // COLOR DE ETIQUETA INACTIVA: NEGRO (más suave para diferenciación)
      unselectedLabelColor: Colors.black54,

      // COLOR DEL INDICADOR (la línea debajo de la pestaña activa): NARANJA
      indicatorColor: _accentOrange,

      labelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),


    // ----------------------------------------------------
    // BARRA DE NAVEGACIÓN INFERIOR (BOTTOM NAVIGATION BAR) - Pedido anterior
    // ----------------------------------------------------
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      // 🚨 FONDO: NARANJA
      backgroundColor: _accentOrange,

      // 🚨 ÍTEM ACTIVO: NEGRO
      selectedItemColor: Colors.black,

      // 🚨 ÍTEM INACTIVO: NEGRO (suave)
      unselectedItemColor: Colors.black54,
    ),
  );
}