import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../model/more_model.dart';

class MoreTab extends StatefulWidget {
  const MoreTab({Key? key}) : super(key: key);

  @override
  _MoreTabState createState() => _MoreTabState();
}

class _MoreTabState extends State<MoreTab> {


  List<MoreModel> mlSettingsData = MoreModelDataList();


  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(

          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                width: Sizes.w400,
                height: Sizes.h40,
                child: TextButton(
                  onPressed: () {
                    toasty(context, 'testing');
                  },
                  style: TextButton.styleFrom(
                      backgroundColor:AppColors.defaultBlue,
                      primary: getColorFromHex('#8998FF')),
                  child: Text(
                    "Switch Work Space",
                    style: primaryTextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: StaggeredGridView.countBuilder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                itemCount: mlSettingsData.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    decoration: boxDecorationWithRoundedCorners(
                      //backgroundColor: AppColors.defaultBlue,
                        border: Border.all(color: Colors.grey.withOpacity(.4)),
                        borderRadius: BorderRadius.all(Radius.circular(10))

                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*SvgPicture.asset(
                          mlSettingsData[index].img!,
                          height: 50,
                          width: 50,
                          //fit: BoxFit.cover,
                        ).cornerRadiusWithClipRRect(12.0),*/
                        Container(
                          decoration: BoxDecoration(
                            color: mlSettingsData[index].menuColor!.withOpacity(.2),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: EdgeInsets.only(left: 8, right: 8),
                          height: 50,
                          child: Icon(
                            mlSettingsData[index].menuIcon!,
                            color: mlSettingsData[index].menuColor!,
                            size: 30,
                          ),
                        ),
                        16.height,
                        Row(
                          children: [
                            Text(
                              mlSettingsData[index].name.toString(),
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: Sizes.w15),
                              textAlign: TextAlign.start,
                            ).expand(),
                            //Icon(Icons.arrow_forward_ios, color: black.withOpacity(.2), size: 12,),
                          ],
                        )
                      ],
                    ),
                  ).onTap(
                        () {
                      Navigator.pushNamed(context, mlSettingsData[index].link.toString());
                    },
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}