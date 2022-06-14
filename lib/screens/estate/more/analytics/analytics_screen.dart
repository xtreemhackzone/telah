import 'package:flutter/material.dart';

import '../../../../widgets/app_bar.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Analytics Report',),
      body: ListView(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        children: [

        ],
      ),
    );
  }
}
