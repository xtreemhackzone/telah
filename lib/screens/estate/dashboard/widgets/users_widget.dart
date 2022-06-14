import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../util/colors.dart';
import '../../property_unit/manage/property_owner_screen.dart';

class UsersWidget extends StatefulWidget {

  final String name;
  final String address;

  UsersWidget({
    required this.name,
    required this.address,
  });

  @override
  State<UsersWidget> createState() => _UsersWidgetState();
}

class _UsersWidgetState extends State<UsersWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UnitPropertyOwnerScreen(),
            ),
          );
        },
        child: Container(
          //height: 79.0,
          width: 500.0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 44.0,
                        width: 44.0,
                        decoration: BoxDecoration(
                          color: AppColors.defaultBlue,
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        child: Center(
                            child: Icon(
                              Iconsax.user,
                              color: Colors.white,
                              size: 25,
                            )
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name, style: TextStyle( fontWeight: FontWeight.bold,),),
                          //Text(widget.name),
                          SizedBox(height: 5,),
                          Text(widget.address),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 4.0),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
