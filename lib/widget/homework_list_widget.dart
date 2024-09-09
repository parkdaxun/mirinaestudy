import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class HomeworkListWidget extends StatelessWidget {
  final String title;
  final String status;
  final String date;

  HomeworkListWidget({required this.title, required this.status, required this.date});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Color statusColor;
    Color statusTextColor;

    switch(status) {
      case "완료":
        statusColor = Color(0xffD3F682);
        statusTextColor = Color(0xff5F9F00);
        break;
      case "진행중":
        statusColor = Color(0xffB5DDFF);
        statusTextColor = Color(0xff0078DE);
        break;
      case "시작전":
        statusColor = Color(0xffE3E3E3);
        statusTextColor = AppColors.black;
        break;
      default:
        statusColor = Colors.white;
        statusTextColor = Colors.white;
    }

    return Container(
      width: screenWidth * 0.91,
      height: screenHeight * 0.11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$title',
                  style: TextStyle(
                    fontFamily: 'NotoSansKRSemiBold',
                    color: AppColors.black,
                    fontSize: 17,
                  ),
                ),
                Container(
                  width: 79,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '$status',
                    style: TextStyle(
                      fontFamily: 'NotoSansKRRegular',
                      fontSize: 12,
                      color: statusTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 9, right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$date',
                  style: TextStyle(
                      fontFamily: 'NotoSansKRRegular',
                      color: AppColors.grey,
                      fontSize: 15,
                  ),
                ),
                Row(
                  children: [
                    Text('상세보기', style: TextStyle(
                      fontFamily: 'NotoSansKRRegular',
                      color: AppColors.grey,
                      fontSize: 14,
                    ),),
                    Padding(
                      padding: const EdgeInsets.only(left: 7.5),
                      child: Image.asset('assets/images/icons/dropdown_icon.png'),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
