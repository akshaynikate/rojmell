import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rojmell/data/list_of_transcations.dart';
import 'package:rojmell/models/salesModel.dart';
import 'package:rojmell/models/transactionBaseModel.dart';

import '../widgets/row_add_sales.dart';

class AddSalesScreen extends StatelessWidget {
  const AddSalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final twoThousend = TextEditingController();
    final fiveHundred = TextEditingController();
    final twoHundred = TextEditingController();
    final oneHundred = TextEditingController();
    final fifty = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Sales'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: double.infinity,
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.1),
                  height: 50,
                  child: Center(
                    child: Text(
                      DateFormat.yMMMEd().format(DateTime.now()),
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
              RowAddSales(number: '2000', controller: twoThousend),
              const SizedBox(
                height: 20,
              ),
              RowAddSales(number: '500', controller: fiveHundred),
              const SizedBox(
                height: 20,
              ),
              RowAddSales(number: '200', controller: twoHundred),
              const SizedBox(
                height: 20,
              ),
              RowAddSales(number: '100', controller: oneHundred),
              const SizedBox(
                height: 20,
              ),
              RowAddSales(number: '50', controller: fifty),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimaryContainer
                        .withOpacity(0.1),
                    width: width * 0.30,
                    height: 30,
                    child: const Center(child: Text('Total')),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  SizedBox(
                      width: width * 0.25,
                      child: ElevatedButton(
                          onPressed: () {
                            if (int.tryParse(twoThousend.text)! < 0) {
                              twoThousend.text = '0';
                            }
                            if (int.tryParse(fiveHundred.text)! < 0) {
                              fiveHundred.text = '0';
                            }
                            if (int.tryParse(twoHundred.text)! < 0) {
                              twoHundred.text = '0';
                            }
                            if (int.tryParse(oneHundred.text)! < 0) {
                              oneHundred.text = '0';
                            }
                            if (int.tryParse(fifty.text)! < 0) {
                              fifty.text = '0';
                            }
                            listOfTransactions.add(SalesModel(
                              modeOfTxn: ModeOfTxn.Cash,
                              date: DateTime.now(),
                              notes: {
                                2000: int.parse(twoThousend.text),
                                500: int.parse(fiveHundred.text),
                                200: int.parse(twoHundred.text),
                                100: int.parse(oneHundred.text),
                                50: int.parse(fifty.text),
                              },
                            ));
                            Navigator.of(context).pop();
                          },
                          child: const Text('Submit')))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
