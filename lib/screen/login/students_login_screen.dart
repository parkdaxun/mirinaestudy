import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinaestudy/styles.dart';
import 'package:mirinaestudy/widget/app_bar.dart';
import 'package:mirinaestudy/widget/social_login_buttons.dart';
import '../../colors.dart';
import '../home_screen.dart';
import '../main_screen.dart';
import '../signup_screen.dart';

class StudentsLoginScreen extends StatefulWidget {
  _StudentsLoginScreenState createState() => _StudentsLoginScreenState();
}

class _StudentsLoginScreenState extends State<StudentsLoginScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: '',
        showIcons: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/mirinaestudy_logo.png',
              height: screenHeight * 0.10781,
              width: screenWidth * 0.42051,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17, bottom: 16),
              child: Text('학생 로그인'),
            ),
            SizedBox(
              height: 48,
              width: screenWidth * 0.802,
              child: TextField(
                decoration: InputInfoTextField.InputInfoTextFieldGrey('이메일'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: SizedBox(
                height: 48,
                width: screenWidth * 0.802,
                child: TextField(
                  decoration: InputInfoTextField.InputInfoTextFieldGrey('비밀번호'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 4,
                right: screenWidth * 0.099,
              ),
              child: SizedBox(height: 19, child: _findPasswordButton()),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: _loginSignupButtons(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17),
              child: _separator(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17),
              child: SocialLoginButtons(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 10),
              child: SizedBox(
                width: screenWidth * 0.79,
                child: TextField(
                  decoration: InputInfoTextField.InputInfoTextFieldGrey('TEXT CODE'),
                ),
              ),
            ),
            SizedBox(
              height: 43,
              width: screenWidth * 0.79,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  backgroundColor: AppColors.blue,
                ),
                child: Text(
                  'Scan Code',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget _findPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ).copyWith(
          overlayColor: MaterialStateProperty.all(Colors.transparent), // 클릭 시 색상 제거
          splashFactory: NoSplash.splashFactory,
        ),
        child: Text(
          '비밀번호 찾기',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.blue,
          ),
        ),
      ),
    );
  }

  Widget _separator() {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Row(
        children: <Widget>[
          Flexible(
            child: Divider(
              color: Color(0xffE7E7E7),
              thickness: 1,
              indent: screenWidth * 0.137,
              endIndent: 10,
            ),
          ),
          Text(
            '또는',
            style: TextStyle(color: AppColors.grey, fontSize: 13),
          ),
          Flexible(
            child: Divider(
              color: Color(0xffE7E7E7),
              thickness: 1,
              indent: 10,
              endIndent: screenWidth * 0.137,
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginSignupButtons() {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 48,
            width: screenWidth * 0.802,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                backgroundColor: AppColors.blue,
              ),
              child: Text(
                '로그인',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen(),),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: SizedBox(
              height: 48,
              width: screenWidth * 0.802,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // 버튼의 배경색
                  borderRadius: BorderRadius.circular(10), // 버튼의 둥글기
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF371E56).withOpacity(0.1), // 그림자의 색상과 투명도
                      blurRadius: 9.2, // 그림자의 흐림 반경
                      spreadRadius: 0, // 그림자의 확산 반경
                      offset: Offset(0, 4), // 그림자의 위치 (x, y)
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0, // 기본 그림자 제거
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // 버튼의 둥글기
                    ),
                    backgroundColor: Colors.transparent, // 배경색을 투명으로 설정
                    padding: EdgeInsets.zero, // 버튼의 패딩 설정
                  ),
                  child: Text(
                    '회원가입',
                    style: TextStyle(color: Color(0xff494949), fontSize: 15), // 텍스트 스타일
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}