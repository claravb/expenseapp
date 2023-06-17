import 'package:flutter/material.dart';
//screens
import 'package:expenseapp/screens/category_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CategoryScreen.name,
      routes: {CategoryScreen.name: (_) => const CategoryScreen()},
    );
  }
}
