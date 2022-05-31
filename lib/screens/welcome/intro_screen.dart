import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:manager/screens/account/sign_in/sign_in.dart';
import '../../util/colors.dart';
import '../../util/strings.dart';
//import '../account/sign_up/account_type_screen.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              const SizedBox(height: 120,),
              Text(userCreateAccountTxt, style: boldTextStyle(size: 32)),
              const SizedBox(height: 10),
              const SizedBox(
                width: 250,
                child: Text(
                    userCreateAccountSubTxt,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    )
                ),
              ),
              const SizedBox(height: 60),
              Center(
                child: SizedBox(
                  width: 250,
                  height: 250,
                    child: Image.asset('assets/png/house.png'),
                ),
              ),
              const SizedBox(height: 16),
              const Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 48, right: 48, bottom: 8, top: 8),
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
                      onTap: () => {
                        /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const AccountTypeScreen()))*/
                      },
                      child: const Center(
                        child: Text(
                          proceedSignUpTxt,
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

              Padding(
                padding: EdgeInsets.only(
                    bottom: 24.0 + MediaQuery.of(context).padding.bottom,
                    top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      haveAccountTxt,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const SignInScreen()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          loginButtonTxt,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}