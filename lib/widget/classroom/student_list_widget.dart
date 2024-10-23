import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../colors.dart';

class StudentListWidget extends StatefulWidget {
  final String name;
  final String studentNumber;
  final String phoneNumber;
  final String email;

  const StudentListWidget({
    Key? key,
    required this.name,
    required this.studentNumber,
    required this.phoneNumber,
    required this.email,
  }) : super(key: key);

  @override
  _StudentListWidgetState createState() => _StudentListWidgetState();
}

class _StudentListWidgetState extends State<StudentListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xff898989).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 9.2,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 14, bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name, style: TextStyle(fontFamily: 'NunitoSansSemiBold', fontSize: 16, color: AppColors.black),),
                Text(widget.studentNumber, style: TextStyle(fontFamily: 'NunitoSansRegular', fontSize: 13, color: AppColors.grey),),
                Text(widget.phoneNumber, style: TextStyle(fontFamily: 'NunitoSansRegular', fontSize: 14, color: AppColors.black),),
                Text(widget.email, style: TextStyle(fontFamily: 'NunitoSansRegular', fontSize: 13, color: AppColors.black),),
              ],
            ),
            SvgPicture.asset('assets/images/icons/dot_setting_icon.svg'),
          ],
        ),
      ),
    );
  }
}