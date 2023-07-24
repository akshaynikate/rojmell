// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../models/transactionBaseModel.dart';

class SalesModel extends TransactionBaseModel {
  SalesModel(
      {required this.modeOfTxn, required this.date, this.amount, this.notes});
  final ModeOfTxn modeOfTxn;
  final DateTime date;
  final int? amount;
//  int amount;
  Map<int, dynamic>? notes;

  String notesList() {
    var noteList = '';
    notes?.forEach((key, value) {
      var subtotal = key * value;
      noteList += "\n $key x $value = $subtotal";
    });
    return noteList;
  }

  double totalSales() {
    var total = 0.0;
    notes?.forEach((key, value) {
      total += (key * value);
    });
    return total;
  }

  SalesModel copyWith({
    ModeOfTxn? modeOfTxn,
    DateTime? date,
    int? amount,
  }) {
    return SalesModel(
      modeOfTxn: modeOfTxn ?? this.modeOfTxn,
      date: date ?? this.date,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'modeOfTxn': modeOfTxn,
      'date': date.millisecondsSinceEpoch,
      'amount': amount,
    };
  }

  factory SalesModel.fromMap(Map<String, dynamic> map) {
    return SalesModel(
      modeOfTxn: map['modeOfTxn'] as ModeOfTxn,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      amount: map['amount'] != null ? map['amount'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SalesModel.fromJson(String source) =>
      SalesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SalesModel(modeOfTxn: $modeOfTxn, date: $date, amount: $amount)';

  @override
  bool operator ==(covariant SalesModel other) {
    if (identical(this, other)) return true;

    return other.modeOfTxn == modeOfTxn &&
        other.date == date &&
        other.amount == amount;
  }

  @override
  int get hashCode => modeOfTxn.hashCode ^ date.hashCode ^ amount.hashCode;
}
