import 'package:flutter/material.dart';
import 'package:manager/widgets/custom_buttons.dart';
import 'package:passwordfield/passwordfield.dart';

import 'package:manager/util/colors.dart';
import 'package:manager/util/size_model.dart';
import 'package:manager/util/strings.dart';

import '../../../../estate/dashboard/manager_dashboard_screen.dart';

class EstatePasswordForm extends StatefulWidget {
  const EstatePasswordForm({Key? key}) : super(key: key);

  @override
  _EstatePasswordFormState createState() => _EstatePasswordFormState();
}

class _EstatePasswordFormState extends State<EstatePasswordForm> {
  final TextEditingController controller = new TextEditingController();
  bool hideText = true;
  IconData visibility = Icons.visibility;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget build(BuildContext context) {

    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: PasswordField(
              color: Colors.blue,
              passwordConstraint: r'.*[@$#.*].*',
              inputDecoration: PasswordDecoration(),
              hintText: 'Enter Strong Password',
              errorMessage:
              'must contain special character either . * @ # \$',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: PasswordField(
              color: AppColors.defaultBlue,
              passwordConstraint: r'.*[@$#.*].*',
              inputDecoration: PasswordDecoration(),
              hintText: 'Confirm Password',
              errorMessage:
              'Password Mismatch',
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          const SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 8, top: 8),
                  child: Container(
                    height: 48,
                    decoration: const BoxDecoration(
                      color: AppColors.defaultBlue,
                      //color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),

                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        highlightColor: Colors.blue.shade400,
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                              ),
                              builder: (context) {
                                return Container(
                                  height: 250.0,
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Image.asset("assets/images/success.gif", alignment:Alignment.center, fit:BoxFit.contain),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          accountCreatedTxt,
                                          //style: kDarkTextStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
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
                                );
                              }
                          );
                        },
                        child: const Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "By signing up, you agree to our",
                          style: TextStyle(color: AppColors.borderLine, fontSize: 12)),
                      TextSpan(
                          text: " terms of service",
                          style: TextStyle(color: AppColors.defaultBlue, fontSize: 12)),
                      TextSpan(
                          text: " and ",
                          style: TextStyle(color: AppColors.borderLine, fontSize: 12)),
                      TextSpan(
                          text: "privacy policy ",
                          style: TextStyle(color: AppColors.defaultBlue, fontSize: 12)),

                    ]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
  proceed() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ManagerDashboard())
    );
  }

}

