import 'package:flutter/material.dart';

import 'screens/expenses_list_screen.dart';
import 'screens/new_expense_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _routes = {
    NewExpenseScreen.routeName: (context) => const NewExpenseScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Wasteagram',
        routes: _routes,
        home: const ExpensesListScreen(),
        theme: ThemeData.dark());
  }
}
