import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expenseapp/models/database_provider.dart';
import 'package:expenseapp/widgets/all_expenses_screen/all_expenses_list.dart';
import 'package:expenseapp/widgets/all_expenses_screen/expense_search.dart';

class AllExpensesFetcher extends StatefulWidget {
  const AllExpensesFetcher({super.key});

  @override
  State<AllExpensesFetcher> createState() => _AllExpensesFetcherState();
}

class _AllExpensesFetcherState extends State<AllExpensesFetcher> {
  @override
  Widget build(BuildContext context) {
    late Future allExpensesList;

    Future getAllExpenses() async {
      final provider = Provider.of<DatabaseProvider>(context, listen: false);
      return await provider.fetchAllExpenses();
    }

    @override
    void initState() {
      super.initState();
      allExpensesList = getAllExpenses();
    }

    return FutureBuilder(
        future: allExpensesList,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      ExpenseSearch(),
                      Expanded(child: AllExpensesList())
                    ],
                  ));
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
