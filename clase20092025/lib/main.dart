// lib/main.dart

import 'package:flutter/material.dart';

// Importa el tema
import 'theme.dart';
// ¡CORRECCIÓN! Debe incluir la subcarpeta 'screens/'
import 'pages/main_screen_page.dart';

// Importa las páginas de navegación que necesitará MainScreen
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'navigation/public_sidebar_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DPL Envíos Locales',
      debugShowCheckedModeBanner: false,
      // ✨ Aplica el tema global definido en theme.dart
      theme: AppTheme.mainTheme,
      // Apunta a la pantalla principal
      home: MainScreen(),
    );
  }
}

// Los widgets auxiliares (ImageSection, TitleSection, TextSection, etc.)
// y la clase MainScreen original ahora van en lib/pages/screens/main_screen.dart