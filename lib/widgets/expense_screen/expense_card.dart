import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenseapp/constants/icons.dart';
import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expense_screen/confirm_box.dart';

class ExpenseCard extends StatelessWidget {
  final Expense exp;
  const ExpenseCard({required this.exp, super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(exp.id),
      confirmDismiss: (_) async {
        showDialog(context: context, builder: (_) => ConfirmBox(exp: exp));
        return null;
      },
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icons[exp.category]),
        ),
        title: Text(exp.title),
        //subtitle: Text(exp.date.toString()),  before intl package
        subtitle: Text(DateFormat('MMMM dd, yyyy').format(exp.date)),
        //trailing: Text(exp.amount.toStringAsFixed(2)),  before intl package
        trailing: Text(NumberFormat.currency(locale: 'en_IN', symbol: '£')
            .format(exp.amount)),
      ),
    );
  }
}
