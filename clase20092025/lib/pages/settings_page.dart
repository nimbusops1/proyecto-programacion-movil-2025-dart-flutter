/*Dejamos este codigo para probarlo cuando creemos otros proyecto y pongamos IOS como plataforma */
/*import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    // Ya no usamos Scaffold, dependerá de AdaptiveNavigationScaffold
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icono principal de configuración
            Icon(
              Icons.settings,
              color: Colors.yellow,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              "Configuración",
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Aquí podrás cambiar ajustes y preferencias de la app.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 30),
            // Switch adaptativo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.wb_sunny,
                  color: Colors.orange,
                  size: 30,
                ),
                const SizedBox(width: 12),
                Switch.adaptive(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
                const SizedBox(width: 12),
                const Icon(
                  Icons.nightlight_round,
                  color: Colors.blue,
                  size: 30,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              _switchValue ? "Modo Oscuro Activado" : "Modo Claro Activado",
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),
            // Iconos de ejemplo adaptativos como en IconDemo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Platform.isIOS ? CupertinoIcons.home : Icons.home,
                  size: 40,
                  color: Colors.yellow,
                ),
                Icon(
                  Platform.isIOS ? CupertinoIcons.person : Icons.person,
                  size: 40,
                  color: Colors.yellow,
                ),
                Icon(
                  Platform.isIOS ? CupertinoIcons.star : Icons.star,
                  size: 40,
                  color: Colors.yellow,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/

/* Adaptamos un poco el codigo para que lo lea ios*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Estado de cada switch
  bool _darkMode = false;
  bool _notifications = true;
  bool _location = false;
  bool _autoUpdate = true;
  bool _backup = false;

  @override
  Widget build(BuildContext context) {
    final bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return Container(
      color: Colors.black, // Fondo negro igual que el scaffold principal
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Icon(
            Icons.settings,
            color: Colors.yellow,
            size: 100,
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "Opciones de la app",
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              "Activa o desactiva las funciones que prefieras.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const SizedBox(height: 30),

          // Listado de switches con iconos
          _buildSwitchTile(
            icon: isIOS ? CupertinoIcons.moon : Icons.dark_mode,
            label: "Modo Oscuro",
            value: _darkMode,
            onChanged: (val) => setState(() => _darkMode = val),
          ),
          _buildSwitchTile(
            icon: isIOS ? CupertinoIcons.bell : Icons.notifications,
            label: "Notificaciones",
            value: _notifications,
            onChanged: (val) => setState(() => _notifications = val),
          ),
          _buildSwitchTile(
            icon: isIOS ? CupertinoIcons.location : Icons.location_on,
            label: "Ubicación",
            value: _location,
            onChanged: (val) => setState(() => _location = val),
          ),
          _buildSwitchTile(
            icon: isIOS ? CupertinoIcons.arrow_2_circlepath : Icons.update,
            label: "Actualizaciones Automáticas",
            value: _autoUpdate,
            onChanged: (val) => setState(() => _autoUpdate = val),
          ),
          _buildSwitchTile(
            icon: isIOS ? CupertinoIcons.cloud : Icons.backup,
            label: "Copia de Seguridad",
            value: _backup,
            onChanged: (val) => setState(() => _backup = val),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.yellow),
        title: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        trailing: Switch.adaptive(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.yellow,
        ),
      ),
    );
  }
}

