import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../../util/decor.dart';
import '../../../util/size_model.dart';
import '../../../widgets/custom_buttons.dart';
import '../../../widgets/custom_dividers.dart';
import 'add_property_unit_photo_screen.dart';

class RentAgreement extends StatefulWidget {
  const RentAgreement({Key? key}) : super(key: key);

  @override
  State<RentAgreement> createState() => _RentAgreementState();
}

class _RentAgreementState extends State<RentAgreement> {
  TextEditingController filecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Padding(
            padding: EdgeInsets.only(
                top: Sizes.h50,
                left: Sizes.w20,
                right: Sizes.w20,
                bottom: Sizes.w10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                LinearProgressIndicator(
                  backgroundColor: Colors.grey.withOpacity(.5),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Colors.blue),
                  value: .7,
                ),
                customDivider(height: Sizes.h50),
                Center(
                  child: Image.asset(
                    'assets/icons/rentagree.png',
                    width: Sizes.w70,
                  ),
                ),
                customDivider(height: Sizes.h20),
                Text(
                  'Rent agreement',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Sizes.w25),
                ),
                customDivider(height: Sizes.h15),
                Text(
                  'Upload a document of the agreement',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: Sizes.w18,
                    height: 1.2,
                  ),
                ),
                customDivider(height: Sizes.h30),
                TextFormField(
                  controller: filecontroller,
                  style: TextStyle(fontSize: Sizes.w13),
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: [ThousandsSeparatorInputFormatter()],
                  textInputAction: TextInputAction.done,
                  decoration: Decor().formDecor(
                      context: context,
                      labelText: '',
                      // suffix: Container(color: Colors.blue,)
                      suffix: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                               filecontroller.text = '';
                            });
                          },
                          child: Container(
                            width: 10,
                            height: 10,
                            color: Colors.red.withOpacity(.4),
                            child: Center(
                              child: ImageIcon(
                                const AssetImage('assets/icons/cancel.png'),
                                color: Colors.red,
                                size: Sizes.w15,
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
                customDivider(height: Sizes.h30),
                GestureDetector(
                  onTap: pickfile,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                      customVerticalDivider(width: Sizes.w5),
                      Text(
                        'Add document',
                        style: TextStyle(
                            color: Colors.blue, fontSize: Sizes.w15),
                      )
                    ],
                  ),
                ),
                customDivider(height: Sizes.h250),
                ButtonWidgets().customButton(
                    context: context,
                    function: proceed,
                    buttonHeight: Sizes.h50,
                    buttonColor: Colors.blue),
              ],
            ),
          ),
        ),
      ),
    );
  }

  pickfile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowedExtensions: [
      'pdf',
    ], type: FileType.custom);
    if (result != null) {
      // File d = File(result.files.single.path!);
      // print(d);
      // print(result.files.single.path);
      setState(() {
        filecontroller.text = result.files.single.name;
      });
    } else {
      // User canceled the picker
    }
  }

  proceed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PhotoUpload()));
  }
}
