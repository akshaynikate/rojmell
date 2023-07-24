import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/list_of_transcations.dart';
import '../models/expenseModel.dart';
import '../models/salesModel.dart';
import '../widgets/ExpenseWidget.dart';

import '../widgets/SalesWidget.dart';
import '../widgets/title_row.dart';
import '../widgets/app_drawer.dart';
import '../widgets/bottom_navigation.dart';

class TranscationScreen extends StatefulWidget {
  const TranscationScreen({super.key});

  @override
  State<TranscationScreen> createState() => _TranscationScreenState();
}

class _TranscationScreenState extends State<TranscationScreen> {
  @override
  Widget build(BuildContext context) {
    //final width = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          title: Text(DateFormat.yMMMEd().format(DateTime.now())),
        ),
        body: Column(
          children: [
            const TitleRow(),
            Expanded(
              child: ListView.builder(
                  itemCount: listOfTransactions.length,
                  itemBuilder: (context, index) => listOfTransactions[index]
                          is SalesModel
                      ? Container(
                          padding: const EdgeInsets.all(5.0),
                          margin: const EdgeInsets.all(2.0),
                          color: const Color.fromARGB(169, 223, 241, 224),
                          child: SalesWidget(
                              model: listOfTransactions[index] as SalesModel),
                        )
                      : Container(
                          padding: const EdgeInsets.all(5.0),
                          margin: const EdgeInsets.all(2.0),
                          color: const Color.fromARGB(122, 237, 215, 214),
                          child: ExpenseWidget(
                              model: listOfTransactions[index] as ExpenseModel),
                        )),
            )
          ],
        ),
        bottomNavigationBar: const BottomNavigation());
  }
}
