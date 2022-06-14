import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/screens/estate/more/settings/user_profile_screen.dart';
import 'package:manager/widgets/app_bar.dart';

import '../../../../util/assets.dart';
import '../../../../util/size_model.dart';
import 'estate_account_details_screen.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  List<Options> securityOptions = [
    Options(title: 'Profile', imagePath: AssetsPath.settingsProfileIcon),
    Options(title: 'Account Settings', imagePath: AssetsPath.settingsAccountIcon),
    Options(title: 'Billing Groups', imagePath: AssetsPath.settingsBillingIcon),
    Options(title: 'Manage Users', imagePath: AssetsPath.settingsManageUsersIcon),
    Options(title: 'Change Password', imagePath: AssetsPath.settingsChangePassIcon),
  ];
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget().appbar(context: context, title: 'Settings'),
        backgroundColor: Colors.white,
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Padding(
            padding: EdgeInsets.only(
                top: Sizes.h20,
                // left: Sizes.w20,
                right: Sizes.w20,
                bottom: Sizes.w10),
            child: Column(
              children: [
                Column(
                  children: securityOptions
                      .map((data) => Padding(
                    padding: EdgeInsets.only(bottom: Sizes.h15),
                    child: ListTile(
                      onTap: () {
                        navigate(data.title!, context);
                      },
                      leading: SvgPicture.asset(data.imagePath!, height: 40),
                      title: Text(data.title!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.w15,
                              color: Colors.black)),
                      trailing: Icon(Iconsax.arrow_circle_right, size: Sizes.w30),
                    ),
                  ))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  navigate(String direction, BuildContext context) {
    if (direction == 'Profile') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const UserProfileScreen()));
    } else if (direction == 'Account Settings') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const EstateAccountDetailsScreen()));
    } else if (direction == 'Billing Groups') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const UserProfileScreen()));
    } else if (direction == 'Manage Users') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const UserProfileScreen()));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const UserProfileScreen()));
    }
  }
}

class Options {
  String? title;
  String? imagePath;
  Options({this.title, this.imagePath});
}