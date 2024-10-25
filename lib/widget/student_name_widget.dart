import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';

class StudentNameWidget extends StatefulWidget {
  final String studentName;
  final bool attendance;

  const StudentNameWidget({
    Key? key,
    required this.studentName,
    required this.attendance,
  }) : super(key: key);


  @override
  _StudentNameWidgetState createState() => _StudentNameWidgetState();
}

class _StudentNameWidgetState extends State<StudentNameWidget> {
  late bool clicked;

  @override
  void initState() {
    super.initState();
    clicked = widget.attendance;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.91,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18, top: 19, bottom: 19, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.studentName, style: TextStyle(fontFamily: 'NunitoSansSemiBold', fontSize: 16, color: AppColors.black),),
            GestureDetector(
              onTap: () {
                setState(() {
                  clicked = !clicked;
                  print(clicked);
                });
              },
              child: Container(
                width: 21, height: 21,
                decoration: BoxDecoration(
                  color: clicked ? AppColors.blue : AppColors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: SvgPicture.asset('assets/images/icons/check_icon.svg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}