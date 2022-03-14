import 'package:flutter/material.dart';

import '../db/db_manager.dart';
import '../db/single_expense_dto.dart';
import '../styles.dart';

class NewExpenseScreen extends StatefulWidget {
  const NewExpenseScreen({Key? key}) : super(key: key);
  static const routeName = "new";
  @override
  State<NewExpenseScreen> createState() => _NewExpenseScreenState();
}

class _NewExpenseScreenState extends State<NewExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final SingleExpenseDTO _singleExpenseDTO = SingleExpenseDTO();

  String? _amountValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    try {
      value = double.parse(value);
      if (value < 1) {
        return 'amount must be greater than 0';
      }
    } catch (err) {
      return 'amount must be a number';
    }
    return null;
  }

  Widget amountFormField(BuildContext context) {
    return Semantics(
      textField: true,
      label: "Amount form field",
      hint: "Sets the amount spent",
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
            textAlign: TextAlign.center,
            style: Styles.bodyText,
            keyboardType: TextInputType.number,
            autofocus: true,
            decoration: const InputDecoration(
                hintText: 'Amount spent', border: UnderlineInputBorder()),
            validator: (value) => _amountValidator(value),
            onSaved: (value) {
              final val = double.parse(value as String);
              _singleExpenseDTO.amount = val;
            }),
      ),
    );
  }

  void _addDateToDTO(dto) {
    dto.date = DateTime.now();
  }

  void _onPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      _addDateToDTO(_singleExpenseDTO);

      DBManager.getInstance()
          .createExpenseEntry(singleExpenseDTO: _singleExpenseDTO);
      Navigator.of(context).pop();
    }
  }

  Widget _formButton() {
    return Semantics(
      button: true,
      label: "Upload expense button",
      onTapHint: "Uploads new expense",
      child: ElevatedButton(
          onPressed: () => _onPressed(),
          child: Container(
            height: 80,
            alignment: Alignment.center,
            child: const Icon(Icons.add, size: 60),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Expense"),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(key: _formKey, child: amountFormField(context)),
                Align(alignment: Alignment.bottomCenter, child: _formButton())
              ],
            ),
          ),
        );
      }),
    );
  }
}
