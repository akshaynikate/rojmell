// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/transactionBaseModel.dart';

@immutable
class ExpenseModel extends TransactionBaseModel {
  ExpenseModel({
    required this.modeOfTxn,
    required this.amount,
    required this.date,
    required this.paidBy,
    required this.paidTo,
  });
  final ModeOfTxn modeOfTxn;
  final double amount;
  final DateTime date;
  final String paidBy;
  final String paidTo;

  ExpenseModel copyWith({
    ModeOfTxn? modeOfTxn,
    double? amount,
    DateTime? date,
    String? paidBy,
    String? paidTo,
  }) {
    return ExpenseModel(
      modeOfTxn: modeOfTxn ?? this.modeOfTxn,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      paidBy: paidBy ?? this.paidBy,
      paidTo: paidTo ?? this.paidTo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'modeOfTxn': modeOfTxn,
      'amount': amount,
      'date': date.millisecondsSinceEpoch,
      'paidBy': paidBy,
      'paidTo': paidTo,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      modeOfTxn: map['modeOfTxn'] as ModeOfTxn,
      amount: map['amount'] as double,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      paidBy: map['paidBy'] as String,
      paidTo: map['paidTo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpenseModel.fromJson(String source) =>
      ExpenseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExpenseModel(modeOfTxn: $modeOfTxn, amount: $amount, date: $date, paidBy: $paidBy, paidTo: $paidTo)';
  }

  @override
  bool operator ==(covariant ExpenseModel other) {
    if (identical(this, other)) return true;

    return other.modeOfTxn == modeOfTxn &&
        other.amount == amount &&
        other.date == date &&
        other.paidBy == paidBy &&
        other.paidTo == paidTo;
  }

  @override
  int get hashCode {
    return modeOfTxn.hashCode ^
        amount.hashCode ^
        date.hashCode ^
        paidBy.hashCode ^
        paidTo.hashCode;
  }
}
