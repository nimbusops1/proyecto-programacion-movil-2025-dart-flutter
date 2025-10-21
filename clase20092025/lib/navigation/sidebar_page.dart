import 'package:flutter/material.dart';

// Importa la pantalla de destino (MainScreen) para la redirección.
// Asegúrate de que esta ruta sea correcta.
import '../pages/main_screen_page.dart'; // Usar dos puntos para subir un nivel y luego ir a 'pages'

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Lilia García"),
            accountEmail: Text("garcia.lilia@uncuyo.edu.ar"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/logo.png"),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFE89F20),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delivery_dining_rounded),
            title: const Text('Mis Pedidos'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.history_rounded),
            title: const Text('Historial de pedidos'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.wallet),
            title: const Text('Mi Billetera'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.star_border_rounded),
            title: const Text('Ranking'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Preferencias'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.support_agent_rounded),
            title: const Text('Soporte'),
            onTap: () {},
          ),
          const Divider(),
// En tu archivo Sidebar (ListTile de 'Cerrar sesión')

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () {
              final Color accentColor = Theme.of(context).colorScheme.secondary;

              // 1. Cierra el Drawer.
              Navigator.pop(context);

              // Obtener la altura de la pantalla para calcular el margen y centrarlo
              final screenHeight = MediaQuery.of(context).size.height;

              // Calcula un margen inferior que lo posicione cerca del centro (ej. 40% de la altura total)
              final double centerMargin = screenHeight * 0.40;

              // 2. Muestra el SnackBar Flotante
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  // Hace que el SnackBar flote con esquinas redondeadas
                  behavior: SnackBarBehavior.floating,

                  // 🚨 CAMBIO CLAVE 1: Usa el margen calculado para centrar verticalmente
                  // El margen izquierdo/derecho asegura que quede centrado horizontalmente
                  margin: EdgeInsets.only(
                      bottom: centerMargin,
                      left: 30.0,
                      right: 30.0
                  ),

                  // 🚨 CAMBIO CLAVE 2: Aumenta el padding para hacerlo más grande
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, // Aumenta el alto
                      horizontal: 30.0 // Aumenta el ancho
                  ),

                  backgroundColor: accentColor,
                  content: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icono más grande para mayor impacto visual
                      Icon(Icons.exit_to_app, color: Colors.black, size: 30),
                      SizedBox(width: 20),
                      Text(
                        "Saliendo de la aplicación...",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18, // Mensaje más grande
                        ),
                      ),
                    ],
                  ),
                  duration: const Duration(milliseconds: 4000),
                ),
              );

              // 3. Redirige a MainScreen
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
                    (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}