import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../util/spacing.dart';
import '../widgets/users_widget.dart';


class UsersTab extends StatefulWidget {
  const UsersTab({Key? key}) : super(key: key);

  @override
  State<UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends State<UsersTab> with SingleTickerProviderStateMixin {

  String? selectedValue;

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text(
                "Users",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.w20
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.defaultBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: AppColors.defaultBlue,
                  ),
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelColor: AppColors.borderLine.withOpacity(0.8),
                  tabs: [
                    Tab(
                      text: 'Active',
                    ),
                    Tab(
                      text: 'Invited',
                    ),
                    Tab(
                      text: 'All',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              //margin: FxSpacing.fromLTRB(10, 10, 15, 0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: FxSpacing.vertical(4),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                          bottom: BorderSide(color: AppColors.borderLine, width: .7),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: FxSpacing.left(12),
                                            child: Icon(
                                              MdiIcons.magnify,
                                              color: AppColors.stepperBg,
                                              size: 28,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: FxSpacing.left(12),
                                              child: TextFormField(

                                                decoration: InputDecoration(
                                                  fillColor: AppColors.stepperBg,
                                                  hintText: "Search for users",
                                                  border: InputBorder.none,
                                                  enabledBorder: InputBorder.none,
                                                  focusedBorder: InputBorder.none,
                                                  isDense: true,
                                                ),
                                                textCapitalization: TextCapitalization.sentences,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            UsersWidget(name: 'John Doe', address: 'Block 5, Room 3',),
                            UsersWidget(name: 'Ebimobowei Okpongu', address: 'Block 5, Room 3',),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [

                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UsersWidget(name: 'John Doe', address: 'Block 5, Room 3',),
                            UsersWidget(name: 'Samuel John', address: 'Block 5, Room 3',),
                            UsersWidget(name: 'Amadi Peter', address: 'Block 5, Room 3',),
                            UsersWidget(name: 'Evenlyn Okon', address: 'Block 5, Room 3',),
                            UsersWidget(name: 'Brenda Okori', address: 'Block 5, Room 3',),
                            UsersWidget(name: 'Chuks Bola', address: 'Block 5, Room 3',),
                            UsersWidget(name: 'Ahmed Bola', address: 'Block 5, Room 3',),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}