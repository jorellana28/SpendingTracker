import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/adaptive_text.dart';
import '../models/single_expense_model.dart';
import '../styles.dart';

class SingleExpenseItem extends StatelessWidget {
  const SingleExpenseItem({Key? key, required this.expense}) : super(key: key);
  final SingleExpenseModel expense;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: AdaptiveText(
            text: DateFormat('EEEE, LLLL dd, yyyy').format(expense.date),
            style: Styles.subHeaderSmallText),
        trailing: AdaptiveText(
            text: "\$${expense.amount}", style: Styles.subHeaderSmallText),
      ),
    );
  }
}
