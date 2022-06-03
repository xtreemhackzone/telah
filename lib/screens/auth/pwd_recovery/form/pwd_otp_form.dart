import 'package:flutter/material.dart';
import '../../../../util/size_model.dart';

class PwdOTPForm extends StatefulWidget {
  const PwdOTPForm({Key? key}) : super(key: key);

  @override
  State<PwdOTPForm> createState() => _PwdOTPFormState();
}

class _PwdOTPFormState extends State<PwdOTPForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  autofocus: true,
                  //obscureText: true,
                  style: const TextStyle(fontSize: 24,
                    fontWeight: FontWeight.w800,),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(

                    enabledBorder: const OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(Sizes.w10))),
                  ),
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  //obscureText: true,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(

                    enabledBorder: const OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(Sizes.w10))),
                  ),
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  //obscureText: true,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(

                    enabledBorder: const OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(Sizes.w10))),
                  ),
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  //obscureText: true,
                  style: const TextStyle(fontSize: 24,
                    fontWeight: FontWeight.w800,),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(

                    enabledBorder: const OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(Sizes.w10))),
                  ),
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FocusNode!.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
