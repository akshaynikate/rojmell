import 'package:flutter/material.dart';

class RowAddSales extends StatelessWidget {
  const RowAddSales(
      {super.key, required this.number, required this.controller});
  final String number;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: width / 4, child: Text(number)),
        SizedBox(width: width / 10, child: const Text('X')),
        SizedBox(
            width: width / 4,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            )),
      ],
    );
  }
}
