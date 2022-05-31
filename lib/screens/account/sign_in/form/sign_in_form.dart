import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../util/strings.dart';
import '../../../../widgets/custom_buttons.dart';
import '../../../estate/dashboard/manager_dashboard_screen.dart';
import '../../../welcome/intro_screen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          FormBuilderTextField(
            name: "Email",
            decoration: const InputDecoration(
              labelText: 'Email',
                suffixIcon: Icon(Iconsax.sms)
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: "Password",
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                      materialTapTargetSize:
                      MaterialTapTargetSize.shrinkWrap,
                      value: check,
                      visualDensity: const VisualDensity(
                          horizontal: -4, vertical: -4),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(Sizes.w5)),
                      onChanged: (value) {
                        setState(() {
                          check = value!;
                        });
                      }),
                  customVerticalDivider(width: Sizes.w5),
                  Text('Stay logged in',
                      style: TextStyle(
                          color: Colors.grey, fontSize: Sizes.w15))
                ],
              ),
              InkWell(
                  onTap: (){
                    /*Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) =>
                    const AccountRecoveryScreen()));*/
                  },
                  child: Text('Forgot password?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Sizes.w15,
                          fontWeight: FontWeight.bold))
              ),

            ],
          ),
          SizedBox(
            height: 50,
          ),
      UserWidgets().customButton(
          context: context,
          function: proceed,
          buttonText: loginButtonTxt,
          buttonHeight: Sizes.h50,
          buttonColor: AppColors.defaultBlue),
          SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?",
                  style: TextStyle(
                      color: Colors.grey, fontSize: Sizes.w15)),
              customVerticalDivider(),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const IntroScreen()));
                },
                child: Text("Sign up",
                    style: TextStyle(
                        color: Colors.blue, fontSize: Sizes.w15)) ,
              ),

            ],
          ),
        ],
      ),
    );
  }
  proceed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ManagerDashboard())
    );
  }
}