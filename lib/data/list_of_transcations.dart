import 'package:rojmell/models/salesModel.dart';

import '../models/expenseModel.dart';
import '../models/transactionBaseModel.dart';

List<TransactionBaseModel> listOfTransactions = [
  ExpenseModel(
      amount: 500,
      date: DateTime.now(),
      paidBy: 'Akshay',
      paidTo: 'S.R.Rakhi',
      modeOfTxn: ModeOfTxn.Cash),
  SalesModel(modeOfTxn: ModeOfTxn.Cash, date: DateTime.now(), notes: {
    500: 20,
    200: 50,
    100: 100,
    50: 50,
  })
];
