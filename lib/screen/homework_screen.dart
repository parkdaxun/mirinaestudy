import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import '../widget/app_bar.dart';

class HomeworkScreen extends StatefulWidget {
  _HomeworkScreenState createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.fillGrey,
      appBar: CustomAppBar(title: '과제'),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: screenWidth,
              height: screenHeight * 0.05,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 19, right: 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '전체',
                      style: TextStyle(color: AppColors.blue, fontSize: 14),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text('2024.07.29~2024.08.29',
                              style: TextStyle(
                                  color: AppColors.grey, fontSize: 14)),
                        ),
                        Image.asset('assets/images/icons/dropdown_icon.png'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Text(
              '과제 진행 상태',
              style: TextStyle(
                color: AppColors.blue,
                fontFamily: 'NotoSansKRMedium',
                fontSize: 14,
              ),
            ),
            informStatus(),
          ],
        ),
      ),
    );
  }

  Widget informStatus() {
    return Row(
      children: <Widget>[
        Container(width: 7, height: 7, decoration: BoxDecoration(
          color: Color(0xffA4ED15),
          borderRadius: BorderRadius.circular(100),
        ),),
        Text('완료', style: TextStyle(color: AppColors.black),),
        Container(width: 7, height: 7, decoration: BoxDecoration(
          color: AppColors.lightBlue,
          borderRadius: BorderRadius.circular(100),
        ),),
        Text('진행중', style: TextStyle(color: AppColors.black),),
        Container(width: 7, height: 7, decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(100),
        ),),
        Text('시작전', style: TextStyle(color: AppColors.black),)
      ],
    );
  }
}
