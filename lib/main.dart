import 'package:expenseapp/screens/expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expenseapp/models/database_provider.dart';

//screens
import 'package:expenseapp/screens/category_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => DatabaseProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CategoryScreen.name,
      routes: {
        CategoryScreen.name: (_) => const CategoryScreen(),
        ExpenseScreen.name: (_) => const ExpenseScreen(),
      },
    );
  }
}
