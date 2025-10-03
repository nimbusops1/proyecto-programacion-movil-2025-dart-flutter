import 'package:flutter/material.dart';
import '../navigation/app_nav_items.dart';

class AdaptiveNavigationScaffold extends StatefulWidget {
  const AdaptiveNavigationScaffold({super.key});

  @override
  State<AdaptiveNavigationScaffold> createState() => _AdaptiveNavigationScaffoldState();
}

class _AdaptiveNavigationScaffoldState extends State<AdaptiveNavigationScaffold> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isCompact = screenSize.width < 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          mainNavItems[_selectedIndex].label,
          style: const TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      // 👇 Ahora mostramos la página desde `pageContent` (nuevo nombre)
      body: Row(
        children: [
          if (!isCompact)
            NavigationRail(
              backgroundColor: Colors.black,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) => setState(() => _selectedIndex = index),
              selectedIconTheme: const IconThemeData(color: Colors.yellow),
              unselectedIconTheme: const IconThemeData(color: Colors.white),
              labelType: NavigationRailLabelType.all,
              destinations: mainNavItems
                  .map(
                    (item) => NavigationRailDestination(
                  icon: Icon(item.icon),
                  label: Text(
                    item.label,
                    style: const TextStyle(color: Colors.yellow),
                  ),
                ),
              )
                  .toList(),
            ),

          // 👇 Mostramos la página activa según el índice
          Expanded(child: mainNavItems[_selectedIndex].pageContent),
        ],
      ),

      // 👇 Barra inferior en pantallas chicas
      bottomNavigationBar: isCompact
          ? BottomNavigationBar(
        backgroundColor: Colors.yellow,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: mainNavItems
            .map(
              (item) => BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.label,
          ),
        )
            .toList(),
      )
          : null,
    );
  }
}
