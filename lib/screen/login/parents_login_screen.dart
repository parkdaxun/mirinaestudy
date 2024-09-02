import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinaestudy/colors.dart';
import 'package:mirinaestudy/screen/home_screen.dart';
import 'package:mirinaestudy/styles.dart';
import '../../widget/app_bar.dart';
import '../main_screen.dart';

class ParentsLoginScreen extends StatefulWidget {
  _ParentsLoginScreenState createState() => _ParentsLoginScreenState();
}

class _ParentsLoginScreenState extends State<ParentsLoginScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: '', showIcons: false,),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/mirinaestudy_logo.png',
                width: screenWidth * 0.561,
                height: screenHeight * 0.1457,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 44),
                child: Text(
                  '학부모 로그인',
                  style: TextStyle(color: Color(0xff494949),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  '자녀의 학생 코드를 입력하세요',
                  style: TextStyle(color: AppColors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 42),
                child: SizedBox(
                  height: 48,
                  width: screenWidth * 0.802,
                  child: TextField(
                    decoration: InputInfoTextField.InputInfoTextFieldGrey(
                        '학생코드'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: _buttons(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttons() {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Container(
      width: screenWidth * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: screenWidth * 0.389,
            height: 48,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff371E56).withOpacity(0.1),
                    blurRadius: 9,
                    spreadRadius: 0,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: TextButton(
                child: Text(
                  '취소', style: TextStyle(color: Colors.black, fontSize: 14),),
                onPressed: () {},
                style: TextButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.389,
            height: 48,
            child: Container(
              child: TextButton(
                child: Text(
                  '확인', style: TextStyle(color: Colors.white, fontSize: 14),),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
                },
                style: TextButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}