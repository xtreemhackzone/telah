import 'package:flutter/material.dart';
import 'package:manager/screens/estate/more/debtors/widgets/debtor_widget.dart';

import '../../../../widgets/app_bar.dart';

class DebtorsListScreen extends StatefulWidget {
  const DebtorsListScreen({Key? key}) : super(key: key);

  @override
  State<DebtorsListScreen> createState() => _DebtorsListScreenState();
}

class _DebtorsListScreenState extends State<DebtorsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Debtors',),
      body: ListView(
        padding: EdgeInsets.only(top: 16,left: 16, right: 16),
        children: [
          DebtorsListWidget(
            address: '100 Bond Street',
            name: 'Elvis Bond',
            amount: 'N500,000',
          ),
          DebtorsListWidget(
            address: '105 Raji Rasaki Avenue',
            name: 'Banky W',
            amount: 'N1,500,000',
          ),
          DebtorsListWidget(
            address: '41 Road B Close',
            name: 'Tukpas Tukus',
            amount: 'N3,500,000',
          ),
        ],
      ),
    );
  }
}
