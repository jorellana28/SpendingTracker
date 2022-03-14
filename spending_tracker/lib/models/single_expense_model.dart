class SingleExpenseModel {
  final double amount;
  final DateTime date;

  SingleExpenseModel({required this.amount, required this.date});

  factory SingleExpenseModel.fromMap(Map map) {
    try {
      return SingleExpenseModel(amount: map['amount'], date: map['date']);
    } on TypeError catch (err) {
      print(err);
      throw Exception("Expense creation failed: missing required fields");
    }
  }

  SingleExpenseModel.empty()
      : amount = 0.0,
        date = DateTime.now();
}
