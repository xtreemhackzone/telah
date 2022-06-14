import 'package:flutter/material.dart';
import '../create/add_service_screen.dart';
import 'widgets/services_widgets.dart';

import '../../../../../util/colors.dart';
import '../../../../../widgets/app_bar.dart';

class ServicesListScreen extends StatefulWidget {
  const ServicesListScreen({Key? key}) : super(key: key);

  @override
  State<ServicesListScreen> createState() => _ServicesListScreenState();
}

class _ServicesListScreenState extends State<ServicesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Services',),
      body: ListView(
        padding: EdgeInsets.only(left: 16, right: 16),
        children: [
          ServicesListCard(
            context,
            serviceName: 'Sanitation',
            billingCycle: 'Monthly',
            amount: 'N5,000.00'
          ),
          ServicesListCard(
              context,
              serviceName: 'Sanitation',
              billingCycle: 'Monthly',
            amount: 'N2,000.00'
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddServiceScreen()));
        },
        elevation: 0,
        backgroundColor: AppColors.defaultBlue,
        label: Text('Add New Service'),
        icon: const Icon(Icons.add),
        //child: const Icon(Icons.add),
      ),
    );
  }
}
