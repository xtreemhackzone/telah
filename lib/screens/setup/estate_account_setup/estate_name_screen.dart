import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manager/widgets/custom_buttons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:manager/util/assets.dart';
import 'package:manager/util/colors.dart';
import 'package:manager/util/size_model.dart';
import '../../../widgets/app_bar.dart';
import 'components/forms/estate_name_form.dart';
import 'estate_email_screen.dart';

class EstateNameScreen extends StatefulWidget {
  const EstateNameScreen({Key? key,}) : super(key: key);

  @override
  _EstateNameScreenState createState() => _EstateNameScreenState();
}

class _EstateNameScreenState extends State<EstateNameScreen> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
        child: Scaffold(
          appBar: AppBarWidget().appbar(context: context,),
          body: Stack(
            children: [
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    SvgPicture.asset(AssetsPath.formHouse, height: 70),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      width: 250,
                      child: Text('Estate Name',
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
                      Text('What is the name of the Estate?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    EstateNameForm()
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ButtonWidgets().customButton(
                    context: context,
                    function: proceed,
                    buttonHeight: Sizes.h50,
                    buttonColor: AppColors.defaultBlue),
              ).paddingOnly(bottom: 20, right: 10, left: 10),
            ],
          ),
        ));
  }
  proceed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EstateEmailScreen())
    );
  }
}