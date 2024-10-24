import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class LessonListWidget extends StatefulWidget {
  final String lessonName;
  final String details;
  final String time;

  const LessonListWidget({
    Key? key,
    required this.lessonName,
    required this.details,
    required this.time,
  }) : super(key: key);

  @override
  _LessonListWidgetState createState() => _LessonListWidgetState();
}

class _LessonListWidgetState extends State<LessonListWidget> {
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
                  widget.lessonName,
                  style: TextStyle(
                      fontFamily: 'NumitoSansSemiBold',
                      fontSize: 16,
                      color: AppColors.black),
                ),
                Text(
                  widget.details,
                  style: TextStyle(
                      fontFamily: 'NumitoSansSemiBold',
                      fontSize: 14,
                      color: AppColors.black),
                ),
              ],
            ),
            Text(
              widget.time,
              style: TextStyle(
                fontSize: 15,
                color: AppColors.blue,
                fontFamily: 'NumitoSansSemiBold',
              ),),
          ],
        ),
      ),
    );
  }
}