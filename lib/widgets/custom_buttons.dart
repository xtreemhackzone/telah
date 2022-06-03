import 'package:flutter/material.dart';
import 'package:number_display/number_display.dart';
import '../util/size_model.dart';


class ButtonWidgets {
  final displayNumber = createDisplay(
    length: 19,
    decimal: 2,
    decimalPoint: '.',
  );

  customButton(
      {required BuildContext context,
        required Function function,
        double? buttonHeight,
        double? buttonTextSize,
        Color? buttonColor,
        String? buttonText}) {
        Sizes().heightSizeCalc(context);
        Sizes().widthSizeCalc(context);
        return SizedBox(
          height: buttonHeight ?? Sizes.h40,
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(Sizes.w10)))),
              onPressed: () {
                function();
              },
              child: Text(buttonText ?? 'Proceed',
                  style: TextStyle(fontSize: buttonTextSize ?? Sizes.w18))),
        );
      }
}