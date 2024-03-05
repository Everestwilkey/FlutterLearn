import 'package:flutter/material.dart';
import 'package:learn_flutter/routs.dart';
import 'package:learn_flutter/components/components.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '208 Trader',
      theme: ForestTheme.theme,
      routes: appRoutes,
    );
  }
}
