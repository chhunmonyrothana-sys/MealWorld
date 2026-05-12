import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state_module/theme_logic.dart';
import 'state_module/meal_provider.dart';
import 'state_module/main_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeLogic()),
        ChangeNotifierProvider(create: (_) => MealProvider()),
      ],
      child: const MealApp(),
    ),
  );
}

class MealApp extends StatelessWidget {
  const MealApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeLogic = context.watch<ThemeLogic>();
    return MaterialApp(
      title: 'MealWorld',
      debugShowCheckedModeBanner: false,
      themeMode: themeLogic.themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFFE65100),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFFE65100),
        brightness: Brightness.dark,
      ),
      home: const MainScreen(),
    );
  }
}