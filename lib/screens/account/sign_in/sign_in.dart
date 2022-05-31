import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../util/assets.dart';
import '../../../util/size_model.dart';
import 'form/sign_in_form.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120,
            ),
            Center(
              child: Image(
                image: const AssetImage('assets/png/welcome_logo.png'),
                height: 50,
              ),
            ),
            SizedBox(height: 30,),
            Center(
                child: Text(
                  'Log In',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Sizes.w30
                  ),
                )
            ),
            SizedBox(height: 16,),
            Text(
              'Enter your email and password',
              style: TextStyle(color: Colors.grey, fontSize: Sizes.w15),
            ),
            SizedBox(height: 30,),
            SignInForm()
          ],
        ),
      ),
    );
  }
}
