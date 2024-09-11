import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinaestudy/widget/app_bar.dart';

import '../colors.dart';
import '../widget/bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.fillGrey,
      appBar: CustomAppBar(title: '홈'),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight*0.06),
            welcomeComment(),
          ],
        ),
      );
  }

  Widget welcomeComment() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('김이름', style: TextStyle(fontSize: 22, color: AppColors.blue),),
            Text('환영합니다!', style: TextStyle(fontSize: 22, color: AppColors.black),),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 19),
          child: Image.asset('assets/images/welcomescreen_pic.png'),
        ),
      ],
    );
  }
}