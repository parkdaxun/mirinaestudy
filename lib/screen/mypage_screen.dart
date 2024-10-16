import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirinaestudy/screen/modify_info_screen.dart';
import '../colors.dart';
import '../widget/app_bar.dart';

class MypageScreen extends StatefulWidget {
  _MypageScreenState createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: '마이페이지'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                  child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.fillGrey,
                ),
                child: Text(
                  '임시 버튼: 정보 수정',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Get.to(() => ModifyInfoScreen());
                },
              )),
            )
          ],
        ),
      ),
    );
  }
}
