import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class ReportListWidget extends StatefulWidget {
  final String title;
  final String teacher;
  final String score;
  final String date;

  const ReportListWidget({
    Key? key,
    required this.title,
    required this.teacher,
    required this.score,
    required this.date,
  }) : super(key: key);

  @override
  _ReportListWidgetState createState() => _ReportListWidgetState();
}

class _ReportListWidgetState extends State<ReportListWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.91,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
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
        padding: const EdgeInsets.only(top: 18, bottom: 18, left: 16, right: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: 'NotoSansKRSemiBold',
                    fontSize: 17,
                  ),
                ),
                Text(
                  widget.score,
                  style: TextStyle(
                    color: AppColors.blue,
                    fontFamily: 'NotoSansKRMedium',
                    fontSize: 15,
                  ),
                )
              ],
            ),
            SizedBox(height: 1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.teacher,
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: 'NotoSansKRRegular',
                    fontSize: 15,
                  ),
                ),
                Text(
                  widget.date,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontFamily: 'NotoSansKRRegular',
                    fontSize: 14,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
