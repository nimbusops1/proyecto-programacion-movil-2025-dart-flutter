import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/orders_page.dart';
import '../pages/profile_page.dart';
import '../pages/settings_page.dart';

class AppNavItem {
  final IconData icon;
  final String label;
  final Widget pageContent;

  const AppNavItem({required this.icon, required this.label, required this.pageContent});
}

final List<AppNavItem> mainNavItems = [
  AppNavItem(
    icon: Icons.home,
    label: 'Inicio',
    pageContent: ProductListPage(), // 👈 ahora carga la lista
  ),
  AppNavItem(
    icon: Icons.local_shipping,
    label: 'Pedidos',
    pageContent: OrdersPage(),
  ),
  AppNavItem(
    icon: Icons.person,
    label: 'Perfil',
    pageContent: ProfilePage(),
  ),
  AppNavItem(
    icon: Icons.settings,
    label: 'Ajustes',
    pageContent: SettingsPage(),
  ),
];