import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../colors.dart';
import '../screen/lesson_screen.dart';

class ClassroomListWidget extends StatefulWidget {
  final String name;
  final String teacherName;
  final int total;

  const ClassroomListWidget({
    Key? key,
    required this.name,
    required this.teacherName,
    required this.total,
  }) : super(key: key);

  @override
  _ClassroomListWidgetState createState() => _ClassroomListWidgetState();
}

class _ClassroomListWidgetState extends State<ClassroomListWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => LessonScreen());
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.91,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 14, right: 20, bottom: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name, style: TextStyle(fontFamily: 'NotoSansKRMedium', fontSize: 17, color: AppColors.black),),
                      Text(widget.teacherName, style: TextStyle(fontFamily: 'NunitoSansRegular', fontSize: 15, color: AppColors.black),),
                    ],
                  ),
                  SvgPicture.asset('assets/images/icons/dot_setting_icon.svg'),
                ],
              ),
              SizedBox(
                width: 61,
                height: 27,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 3.0),
                    backgroundColor: Color(0xffF2FBFF),
                    side: BorderSide(
                      color: Color(0xffAFDAFF),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    '총 ${widget.total}',
                    style: TextStyle(fontFamily: 'NotoSansKRMedium', fontSize: 13, color: Color(0xff6EBCFF),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
