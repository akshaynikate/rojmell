import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            width: width / 2,
            child: const Text(
              'Description',
              textAlign: TextAlign.center,
            )),
        SizedBox(width: width / 4, child: const Text('Income')),
        SizedBox(width: width / 4, child: const Text('Expense'))
      ],
    );
  }
}
