import 'package:flutter/material.dart';
import 'package:expenseapp/models/ex_category.dart';
import 'package:expenseapp/screens/expense_screen.dart';
import 'package:intl/intl.dart';

class CategoryCard extends StatelessWidget {
  final ExpenseCategory category;
  const CategoryCard({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(
          ExpenseScreen.name,
          arguments: category.title, // for expense screen.
        );
      },
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(category.icon),
      ),
      title: Text(category.title),
      subtitle: Text('entries: ${category.entries}'),
      // trailing: Text('\$ ${(category.totalAmount).toStringAsFixed(2)}'),
      trailing: Text(NumberFormat.currency(locale: 'en_IN', symbol: '£')
          .format(category.totalAmount)),
    );
  }
}
