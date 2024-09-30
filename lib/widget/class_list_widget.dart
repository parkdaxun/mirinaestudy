import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class ClassListWidget extends StatefulWidget {
  final String className;
  final String teacherName;
  final String time;

  const ClassListWidget({
    Key? key,
    required this.className,
    required this.teacherName,
    required this.time,
  }) : super(key: key);

  @override
  _ClassListWidgetState createState() => _ClassListWidgetState();
}

class _ClassListWidgetState extends State<ClassListWidget> {
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
        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 21, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Grammer Lesson',
                  style: TextStyle(
                      fontFamily: 'NotoSansKRSemiBold',
                      fontSize: 16,
                      color: AppColors.black),
                ),
                Text(
                  'Robert Smith',
                  style: TextStyle(
                      fontFamily: 'NotoSansKRRegular',
                      fontSize: 14,
                      color: AppColors.black),
                ),
              ],
            ),
            Text(
              '10:30 AM',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.blue,
                fontFamily: 'NotoSansKRSemiBold',
              ),),
          ],
        ),
      ),
    );
  }
}