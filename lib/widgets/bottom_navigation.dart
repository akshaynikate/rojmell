import 'package:flutter/material.dart';

import '../screens/add_expense_screen.dart';
import '../screens/add_sales_screen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: width / 2,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddExpenseScreen()));
            },
            child: const Text('Add Expenses'),
          ),
        ),
        SizedBox(
          width: width / 2,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddSalesScreen()));
            },
            child: const Text('Add Sales'),
          ),
        ),
      ],
    );
  }
}
