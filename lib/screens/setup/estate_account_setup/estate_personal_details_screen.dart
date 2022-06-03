import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../widgets/app_bar.dart';
import 'components/forms/estate_personal_details_form.dart';

import 'package:manager/util/assets.dart';
import 'package:manager/util/size_model.dart';

class EstatePersonalDetailsScreen extends StatefulWidget {
  const EstatePersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  _EstatePersonalDetailsScreenState createState() => _EstatePersonalDetailsScreenState();
}

class _EstatePersonalDetailsScreenState extends State<EstatePersonalDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
        child: Scaffold(
          appBar: AppBarWidget().appbar(context: context,),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  SvgPicture.asset(AssetsPath.formPersonalInfo, height: 70),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    width: 250,
                    child: Text('Enter Personal Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                        )),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    //width: 250,
                    child:
                    Text('Please use your real name',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  EstatePersonalDetailsForm()
                ],
              ),
            ),
          ),
        ));
  }
}
