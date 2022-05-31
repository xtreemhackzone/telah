import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:manager/util/assets.dart';


class UsersTab extends StatefulWidget {
  const UsersTab({Key? key}) : super(key: key);

  @override
  State<UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends State<UsersTab> {
  bool fireOnce = false;
  int value = 1;
  @override
  Widget build(BuildContext context) {
    // widget build
    if (!fireOnce) {
      fireOnce = true;
      parseSVG(AssetsPath.debtorsIcon);
    }
    return Container(
      child: Column(
        children: [
          SvgPicture.asset(AssetsPath.accountSettingsIcon),
        ],
      ),
    );
  }

  // widget method
  Future<void> parseSVG(String assetName) async {
    final SvgParser parser = SvgParser();
    final svgString = await rootBundle.loadString(assetName);
    try {
      await parser.parse(svgString, warningsAsErrors: true);
      print('SVG is supported');
    } catch (e) {
      print('SVG contains unsupported features');
      print(e);
    }
  }
}