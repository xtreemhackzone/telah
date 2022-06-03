import 'package:flutter/material.dart';
import 'package:manager/widgets/custom_buttons.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../util/colors.dart';
import '../../../util/size_model.dart';


class AccountCreatedScreen extends StatefulWidget {
  const AccountCreatedScreen({Key? key}) : super(key: key);

  @override
  _AccountCreatedScreenState createState() => _AccountCreatedScreenState();
}

class _AccountCreatedScreenState extends State<AccountCreatedScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 230,
              padding: const EdgeInsets.all(32),
              child: Image.asset('assets/images/success.gif'),
            ),
            70.height,
            Text('Account Created Successfully', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            50.height,
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 8, top: 8),
              child: ButtonWidgets().customButton(
                  context: context,
                  function: proceed,
                  buttonText: "Start using TELAH",
                  buttonHeight: Sizes.h50,
                  buttonColor: AppColors.defaultBlue),
            ),
          ],
        ),
      ),
    );
  }
  proceed() {

  }
}
