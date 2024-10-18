import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mirinaestudy/widget/app_bar.dart';

import '../colors.dart';
import '../widget/classroom_post_widget.dart';

class ClassroomScreen extends StatefulWidget {
  _ClassroomScreenState createState() => _ClassroomScreenState();
}

class _ClassroomScreenState extends State<ClassroomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fillGrey,
      appBar: CustomAppBar(title: '교실'),
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.91,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 26, bottom: 13),
                    child: AddClassWidget(),
                  ),
                  ClassroomPostWidget(
                    name: '',
                    date: '',
                    like: 1,
                    comment: 1,
                    content: '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget AddClassWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xff898989).withOpacity(0.1),
            blurRadius: 9.2,
            spreadRadius: 1,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 11, bottom: 11),
        child: Row(
          children: [
            Container(
              width: 21, height: 21,
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SvgPicture.asset('assets/images/icons/add_icon.svg'),
              ),
            ),
            SizedBox(width: 10),
            Text('게시글 추가하기', style: TextStyle(fontFamily: 'NotoSansKRRegular', fontSize: 15, color: AppColors.black),),
          ],
        ),
      ),
    );
  }
}