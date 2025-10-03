import 'package:flutter/material.dart';
import 'theme.dart';
import 'widgets/adaptive_scaffold.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pato Lucas Delivery',
      theme: AppTheme.mainTheme,
      home: AdaptiveNavigationScaffold(),
    );
  }
}
