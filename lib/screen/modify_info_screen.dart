import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinaestudy/widget/app_bar.dart';

import '../colors.dart';
import '../styles.dart';
import '../widget/modify_info_buttons.dart';

class ModifyInfoScreen extends StatefulWidget {
  _ModifyInfoScreenState createState() => _ModifyInfoScreenState();
}

class _ModifyInfoScreenState extends State<ModifyInfoScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double textFieldWidth = screenWidth * 0.84;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: '정보 수정'),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.04,
                    left: (screenWidth - textFieldWidth) / 2),
                child: Text(
                  '회원 계정정보',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              _textFields(),
              _saveButton(),
              Padding(
                padding: const EdgeInsets.only(top: 29),
                child: _otherButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFields() {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: SizedBox(
              height: 48,
              width: screenWidth * 0.84,
              child: TextField(
                cursorColor: AppColors.blue,
                decoration: InputInfoTextField.InputInfoTextFieldWhite('이름'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 11),
            child: SizedBox(
              height: 48,
              width: screenWidth * 0.84,
              child: TextField(
                cursorColor: AppColors.blue,
                decoration: InputInfoTextField.InputInfoTextFieldWhite('이메일'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 11),
            child: SizedBox(
              height: 48,
              width: screenWidth * 0.84,
              child: TextField(
                cursorColor: AppColors.blue,
                decoration: InputInfoTextField.InputInfoTextFieldWhite('새 비밀번호'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 11),
            child: SizedBox(
              height: 48,
              width: screenWidth * 0.84,
              child: TextField(
                cursorColor: AppColors.blue,
                decoration:
                    InputInfoTextField.InputInfoTextFieldWhite('새 비밀번호 확인'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _saveButton() {
    double screenWidth = MediaQuery.of(context).size.width;
    double textFieldWidth = screenWidth * 0.84;

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 14),
        child: SizedBox(
          width: textFieldWidth,
          height: 48,
          child: TextButton(
            child: Text(
              '저장하기',
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(
              backgroundColor: AppColors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  Widget _otherButtons() {
    double screenWidth = MediaQuery.of(context).size.width;
    double textFieldWidth = screenWidth * 0.84;

    return Center(
        child: Column(
      children: <Widget>[
        ModifyInfoButtons(text: '알림 설정'),
        Padding(
          padding: const EdgeInsets.only(top: 9),
          child: ModifyInfoButtons(text: '공지 사항'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 9),
          child: ModifyInfoButtons(text: '개인정보 처리방침'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 9),
          child: ModifyInfoButtons(text: '서비스 이용 약관'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 9),
          child: ModifyInfoButtons(text: '고객센터'),
        ),
      ],
    ),);
  }
}
