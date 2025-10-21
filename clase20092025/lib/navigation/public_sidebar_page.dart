import 'package:flutter/material.dart';
// Asume que estas páginas están definidas en 'pages/'
import '../pages/login_page.dart';
import '../pages/register_page.dart';
import '../pages/settings_page.dart';

class PublicSidebar extends StatelessWidget {
  const PublicSidebar({super.key});

  @override
  Widget build(BuildContext context) {

    // ✨ CORRECCIÓN AQUÍ: Definimos el color que queremos para el encabezado.
    // Usamos el ámbar/naranja (#E89F20) que tenías como color secundario en tu diseño original.
    final Color headerColor = const Color(0xFFE89F20);

    // El 'accentColor' toma el valor de Theme.of(context).primaryColor (que es negro en theme.dart)
    // final Color accentColor = Theme.of(context).primaryColor;

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              // ATRIBUTO CORREGIDO: Usamos el color ámbar/naranja (#E89F20)
              // para el fondo del encabezado del Drawer.
              color: headerColor,
            ),
            child: const Center(
              child: Text(
                'DPL',
                style: TextStyle(
                  // El texto es casi negro para contrastar con el fondo ámbar/naranja
                  color: Color(0xFF090909),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Iniciar Sesión'),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.app_registration),
            title: const Text('Registrarse'),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración Básica'),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer
              // Asume que tienes una SettingsPage
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
          ),
        ],
      ),
    );
  }
}