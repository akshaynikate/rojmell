import 'package:flutter/material.dart';
import 'package:rojmell/models/expenseModel.dart';

class ExpenseWidget extends StatelessWidget {
  const ExpenseWidget({super.key, required this.model});
  final ExpenseModel model;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: width / 2,
          child: Column(
            children: [
              Row(
                children: [
                  const Text('Paid By: '),
                  Text(model.paidBy),
                ],
              ),
              Row(
                children: [
                  const Text('Paid To: '),
                  Text(model.paidTo),
                ],
              ),
              Row(
                children: [
                  const Text('Mode Of Transaction: '),
                  Text(model.modeOfTxn.name.toString()),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          width: width / 4,
          child: Text(
            model.amount.toString(),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
