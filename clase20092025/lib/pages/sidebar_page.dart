import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader( // Aca llamar a los datos del usuario autenticado
            accountName: Text("Lilia García"),
            accountEmail: Text("garcia.lilia@uncuyo.edu.ar"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/logo.png"),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFFF9900),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pop(context); // cierra el drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.delivery_dining_rounded),
            title: const Text('Mis Pedidos'),
            onTap: () {
              Navigator.pop(context); // cierra el drawer
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
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
