import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';

class AlarmListWidget extends StatefulWidget {
  _AlarmWidgetState createState() => _AlarmWidgetState();
}

class _AlarmWidgetState extends State<AlarmListWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        setState(() {selected = !selected;});
      },
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.12,
        decoration: BoxDecoration(
          color: selected ? Color(0xffF2FBFF) : Colors.white,
          border: Border(
            bottom: BorderSide(color: Color(0xffE2E2E2), width: 0.5),
            top: BorderSide(color: Color(0xffE2E2E2), width: 0.5),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 17, right: 10),
              child: SvgPicture.asset(
                selected
                    ? 'assets/images/icons/bell_filled_blue_icon.svg'
                    : 'assets/images/icons/bell_filled_grey_icon.svg',
              ),
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
                SizedBox(
                  height: 3,
                ),
                Text(
                  '과제 제출 2024.09.06에 만료됩니다.',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'NotoSansKRRegular',
                    color: AppColors.black,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
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
      ),
    );
  }
}
