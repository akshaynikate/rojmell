import 'package:flutter/material.dart';

import '../screens/transactions_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rojmell',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(193, 193, 3, 3)),
        useMaterial3: true,
      ),
      home: const TranscationScreen(),
    );
  }
}
