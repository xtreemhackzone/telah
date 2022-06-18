import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/custom_buttons.dart';
import '../../../../widgets/custom_dividers.dart';

class UnresolvedPaymentDeatilsScreen extends StatefulWidget {
  const UnresolvedPaymentDeatilsScreen({Key? key}) : super(key: key);

  @override
  State<UnresolvedPaymentDeatilsScreen> createState() => _UnresolvedPaymentDeatilsScreenState();
}

class _UnresolvedPaymentDeatilsScreenState extends State<UnresolvedPaymentDeatilsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: Sizes.h70,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('John Doe', style: TextStyle(color: Colors.black, fontSize: Sizes.w18, fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: EdgeInsets.only(bottom: Sizes.h10, right: Sizes.w10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(

                    child: Text('Reject', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.errorText),)
                ),
                customVerticalDivider(width: Sizes.w10),
                InkWell(
                    onTap: (){
                      /*Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => const NotificationScreen()));*/
                    },
                    child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(6))
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.check, color: Colors.white,),
                            Text('Approve')
                          ],
                        )
                    )
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text("Summary", style: TextStyle(fontSize: Sizes.w18, fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Center(
              child: Container(
                width: Sizes.w80,
                height: Sizes.h80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.w10),
                  color: AppColors.defaultBlue,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("EO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Text("Ebimobowei Okpongu",
              style: TextStyle(
                fontSize: Sizes.w20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text("Block 23, Sage Estates"),
            SizedBox(height: 20,),
            Text("Property Unit Type"),
            SizedBox(height: 10,),
            Text("Bungalow", style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: Sizes.h130,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.warningText.withOpacity(.15),
                  borderRadius:
                  BorderRadius.all(Radius.circular(Sizes.w15))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('N2,000,000',
                      style: TextStyle(
                          color: AppColors.defaultBlue, fontSize: Sizes.w22, fontWeight: FontWeight.bold)),
                  customDivider(height: Sizes.h5),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        //border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: Text('Water Bill - Jan',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Sizes.w15)),
                  ),
                  customDivider(height: Sizes.h5),

                ],
              ),
            ),
            SizedBox(height: 30,),
            Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ButtonWidgets().utilityButton(context: context, function: print, icon: Iconsax.printer, buttonText: "Print"),
                    customVerticalDivider(width: Sizes.w15),
                    ButtonWidgets().utilityButton(context: context, function: print, icon: Iconsax.import, buttonText: "Download"),
                    customVerticalDivider(width: Sizes.w15),
                    ButtonWidgets().utilityButton(context: context, function: print, icon: Icons.share_outlined, buttonText: "Share"),
                    SizedBox(height: 20,),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}