import 'package:flutter/material.dart';

import '../screens/report_Screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Drawer(
      width: width / 1.5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
        ),
        body: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.receipt_long_rounded),
              title: const Text('Report'),
              subtitle: const Text('previous transactions'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ReportScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              subtitle: const Text('change language,theme,etc'),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
