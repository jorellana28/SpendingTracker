import 'package:flutter/material.dart';
import 'package:journal/components/adaptive_text.dart';
import 'package:journal/styles.dart';

import '../components/fab.dart';
import '../components/single_expense_item.dart';
import '../db/db_manager.dart';
import '../models/single_expense_model.dart';
import 'new_expense_screen.dart';

class ExpensesListScreen extends StatefulWidget {
  const ExpensesListScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = "/";
  @override
  State<ExpensesListScreen> createState() => _ExpensesListScreenState();
}

class _ExpensesListScreenState extends State<ExpensesListScreen> {
  final DBManager _dbManager = DBManager.getInstance();

  void _onFabPressed() async {
    await Navigator.of(context).pushNamed(NewExpenseScreen.routeName);
    setState(() {});
  }

  double _calculateTotalForDateRange(
      Map<String, num> dateRange, List<SingleExpenseModel> data) {
    if (data.length == 1) {
      return data.first.amount;
    }
    return data
        .map((e) {
          final day = e.date.day;
          return day > dateRange['start']! && day < dateRange['end']!
              ? e.amount
              : 0.0;
        })
        .toList()
        .reduce((value, element) => value + element);
  }

  Widget _totalAmountForDateRange(data, Map<String, num> dateRange) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AdaptiveText(
            text: "Total (${dateRange['start']} - ${dateRange['end']}):",
            style: Styles.subHeaderLrgText),
        AdaptiveText(
            text: "\$${_calculateTotalForDateRange({
                  'start': dateRange['start']!,
                  'end': dateRange['end']!
                }, data)}",
            style: Styles.subHeaderLrgText),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Spending Tracker"),
          centerTitle: true,
        ),
        body: FutureBuilder<Object>(
            future: _dbManager.readExpenseEntries(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.data != null &&
                  (snapshot.data as List<SingleExpenseModel>).isNotEmpty) {
                // Type casting here to avoid doing this a bunch of times
                var data = (snapshot.data as List<SingleExpenseModel>);
                // Sort to determine the current month and year
                data.sort((a, b) => DateTime.parse(b.date.toString())
                    .compareTo(DateTime.parse(a.date.toString())));
                final currentMonth = data[0].date.month;
                final currentYear = data[0].date.year;
                // Filter data from previous months and years
                data = data
                    .where((e) =>
                        e.date.month == currentMonth &&
                        e.date.year == currentYear)
                    .toList();
                return ListView(children: [
                  _totalAmountForDateRange(data, {'start': 1, 'end': 14}),
                  _totalAmountForDateRange(data, {'start': 15, 'end': 31}),
                  ...data
                      .map<SingleExpenseItem>((entry) => SingleExpenseItem(
                            expense: entry,
                          ))
                      .toList()
                ]);
              } else {
                return const Center(child: Icon(Icons.money));
              }
            }),
        floatingActionButton: Fab(onPressed: _onFabPressed),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
