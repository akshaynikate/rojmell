import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rojmell/data/list_of_transcations.dart';
import 'package:rojmell/models/salesModel.dart';
import 'package:rojmell/models/transactionBaseModel.dart';

import '../models/expenseModel.dart';
import '../widgets/ExpenseWidget.dart';
import '../widgets/SalesWidget.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  DateTime? firstDate;
  DateTime? lastDate;
  List<TransactionBaseModel> reports = [];

  List<TransactionBaseModel> generateReports() {
    listOfTransactions.forEach((element) {
      if (element is ExpenseModel &&
          (DateUtils.isSameDay(element.date, firstDate) ||
              element.date.isAfter(firstDate!)) &&
          (DateUtils.isSameDay(element.date, lastDate) ||
              element.date.isBefore(lastDate!))) {
        if (!reports.contains(element)) {
          reports.add(element);
        } else if (element is SalesModel &&
            element.date.isAfter(firstDate!) &&
            element.date.isBefore(lastDate!)) {
          //date.isAfter(element.date);
          if (!reports.contains(element)) {
            reports.add(element);
          }
        }
      }
    });
    reports = reports;
    return reports;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: (firstDate != null && lastDate != null)
              ? Text(
                  'Showing transcations from ${DateFormat.yMMMEd().format(firstDate!)} to ${DateFormat.yMMMEd().format(lastDate!)}')
              : const Text('Reports..'),
          actions: [
            TextButton.icon(
              onPressed: () async {
                final range = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2022),
                    lastDate: DateTime.now());
                setState(() {
                  firstDate = range!.start;
                  lastDate = range.end;
                });
              },
              label: const Text('Select Dates'),
              icon: const Icon(Icons.date_range),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: reports.length,
            itemBuilder: (context, index) => reports[index] is SalesModel
                ? Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(2.0),
                    color: const Color.fromARGB(169, 223, 241, 224),
                    child: SalesWidget(model: reports[index] as SalesModel),
                  )
                : Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(2.0),
                    color: const Color.fromARGB(122, 237, 215, 214),
                    child: ExpenseWidget(model: reports[index] as ExpenseModel),
                  )));
  }
}
