import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import '../../../util/size_model.dart';
import 'components/forms/account_password_form.dart';

class AccountPwdScreen extends StatefulWidget {
  final String optionSelected;
  const AccountPwdScreen({Key? key, required this.optionSelected}) : super(key: key);

  @override
  _AccountPwdScreenState createState() => _AccountPwdScreenState();
}

class _AccountPwdScreenState extends State<AccountPwdScreen> {



  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Center(
                        child: FAProgressBar(
                          currentValue: 95,
                          backgroundColor: const Color(0xffE3E6E8),
                          progressColor: Colors.blue,
                          size: 9,
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 60,
                    child: Image.asset('assets/images/key.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    width: 250,
                    child: Text('Password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        )),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    //width: 250,
                    child:
                    Text('Set your password, make it difficult to guess',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AccountPasswordForm(optionSelected: widget.optionSelected)
                ],
              ),
            ),
          ),
        ));
  }
}
