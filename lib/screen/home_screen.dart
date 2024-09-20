import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinaestudy/widget/app_bar.dart';
import 'package:mirinaestudy/widget/home_menu.dart';

import '../colors.dart';
import '../widget/bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fillGrey,
      appBar: CustomAppBar(title: '홈'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          welcomeComment(),
          Padding(
            padding: const EdgeInsets.only(top: 23, bottom: 14, left: 17),
            child: Text(
              '나의 게시판',
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'NotoSansKRSemiBold',
                  color: AppColors.blue),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMenuWidget(title: '수업', iconName: 'class_active_icon', screenName: 'ClassScreen',),
              HomeMenuWidget(title: '과제', iconName: 'homework_active_icon', screenName: 'HomeworkScreen',),
              HomeMenuWidget(title: '출석', iconName: 'attend_icon', screenName: '',),
              HomeMenuWidget(title: '설정', iconName: 'setting_icon', screenName: '',),
            ],
          ),
          SizedBox(
            height: 11,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMenuWidget(title: '교실', iconName: 'classroom_icon', screenName: '',),
              HomeMenuWidget(title: '성적표', iconName: 'paper_icon', screenName: '',),
              HomeMenuWidget(title: '결제', iconName: 'card_icon', screenName: '',),
              HomeMenuWidget(title: '고객문의', iconName: 'ask_icon', screenName: '',),
            ],
          ),
        ],
      ),
    );
  }

  Widget welcomeComment() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight * 0.18,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '김이름',
                style: TextStyle(
                    fontSize: 22,
                    color: AppColors.blue,
                    fontFamily: 'NotoSansKRSemiBold'),
              ),
              Text(
                '환영합니다!',
                style: TextStyle(
                    fontSize: 22,
                    color: AppColors.black,
                    fontFamily: 'NotoSansKRSemiBold'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 19),
            child: Image.asset(
              width: 149,
              height: 79,
              'assets/images/bigsize_pic.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
