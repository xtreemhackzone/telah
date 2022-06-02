import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../controller/login_controller.dart';
import '../../../../util/colors.dart';
import '../../../../util/constant.dart';
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
  final _loginController = LoginController();
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.only(left: 16, right: 16),
      child: ReactiveFormBuilder(
        form: _loginController.formGroup,
        builder: (context, form, child) => Column(
          children: [
            ReactiveTextField(
              formControlName: LoginField.IDENTIFIER.name,
              decoration: const InputDecoration(
                  labelText: 'Email',
                  suffixIcon: Icon(Iconsax.sms)
              ),
              onSubmitted: () => form.focus(LoginField.PASSWORD.name),
              validationMessages: (control) => {
                ValidationMessage.required: kEmailNullError,
                ValidationMessage.email:
                kInvalidEmailError,
                'unique': 'This email is already in use',
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ReactiveTextField(
              formControlName: LoginField.PASSWORD.name,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              onSubmitted: () => form.unfocus(),
              validationMessages: (control) => {
                ValidationMessage.required: kPassNullError,
                ValidationMessage.minLength: kShortPassError,
              },
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ReactiveCheckbox(
                      formControlName: LoginField.CHECKBOX.name,
                        materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                        visualDensity: const VisualDensity(
                            horizontal: -4, vertical: -4),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(Sizes.w5)),
                        ),
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
            ReactiveFormConsumer(builder: (context, formGroup, child) => UserWidgets().customButton(
                context: context,
                function: form.valid ? () async {
                  var result = await LoginController().login(formGroup);
                  if (result != null) {
                    proceed();
                  }
                } : form.markAllAsTouched,
                buttonText: loginButtonTxt,
                buttonHeight: Sizes.h50,
                buttonColor: AppColors.defaultBlue),),
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
      ),
    );
  }
  proceed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ManagerDashboard())
    );
  }
}