import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rojmell/data/list_of_transcations.dart';
import 'package:rojmell/models/expenseModel.dart';
import 'package:rojmell/models/transactionBaseModel.dart';
//import '../models/transactionBaseModel.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final paidByController = TextEditingController();
  final paidToController = TextEditingController();
  final amountController = TextEditingController();
  String? selectedMode;
  final mode = ['online', 'cash'];
  late var selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    selectedMode = 'cash';
  }

  @override
  void dispose() {
    super.dispose();
    paidByController.dispose();
    paidToController.dispose();
    amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: paidByController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Enter Name of person who paid...'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: paidToController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Enter Name of person paid to...'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: amountController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Enter Name of amount...'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Select mode of transcation :'),
                    const SizedBox(
                      width: 5,
                    ),
                    DropdownButton<String>(
                      items: mode.map((String dropDownStringItems) {
                        return DropdownMenuItem<String>(
                            value: dropDownStringItems,
                            child: Text(dropDownStringItems));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedMode = value.toString();
                        });
                      },
                      value: selectedMode,
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.date_range),
                      label: const Text('Select Date:'),
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(2022),
                            lastDate: selectedDate);
                        if (pickedDate != null) {
                          setState(() {
                            selectedDate = pickedDate;
                          });
                        }
                      },
                    ),
                    Text(DateFormat.yMMMEd().format(selectedDate))
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    onPressed: () {
                      listOfTransactions.add(ExpenseModel(
                          amount: double.parse(amountController.text),
                          date: selectedDate,
                          paidBy: paidByController.text,
                          paidTo: paidToController.text,
                          modeOfTxn: selectedMode == 'cash'
                              ? ModeOfTxn.Cash
                              : ModeOfTxn.Online));
                      Navigator.of(context).pop();
                    },
                    child: const Text('Add Expense'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
