import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class AlarmListWidget extends StatefulWidget {
  _AlarmWidgetState createState() => _AlarmWidgetState();
}

class _AlarmWidgetState extends State<AlarmListWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight * 0.12,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xffE2E2E2), width: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 17, right: 10),
            child: Image.asset('assets/images/icons/bell_filled_grey_icon.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Mirinae Study',
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'NotoSansKRSemiBold',
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 3,),
              Text(
                '과제 제출 2024.09.06에 만료됩니다.',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'NotoSansKRRegular',
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 7,),
              Text(
                '2024-09-03 08:34 PM',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'NotoSansKRRegular',
                  color: Color(0xffACB6CB),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
