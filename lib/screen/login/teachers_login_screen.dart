import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinaestudy/screen/main_screen.dart';
import 'package:mirinaestudy/screen/login/signup_screen.dart';
import 'package:mirinaestudy/widget/app_bar.dart';
import 'package:mirinaestudy/widget/social_login_buttons.dart';
import '../../colors.dart';

class LoginScreen extends StatefulWidget {
  final String accountType;

  LoginScreen({required this.accountType});

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              width: screenWidth * 0.561,
              height: screenHeight * 0.1457,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                '${widget.accountType} 로그인',
                style: TextStyle(
                    fontFamily: "NotoSansKRSemiBold",
                    fontSize: 16,
                    color: AppColors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: _textFields(context), // context를 전달합니다.
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 4,
                right: screenWidth * 0.099, // 오른쪽 여백을 화면 너비의 9%로 설정
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
          ],
        ),
      ),
    );
  }

  Widget _textFields(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 48,
            width: screenWidth * 0.802,
            child: TextField(
              cursorColor: AppColors.grey,
              decoration: InputDecoration(
                fillColor: AppColors.fillGrey,
                filled: true,
                hintText: '이메일',
                hintStyle: TextStyle(
                  fontFamily: 'NotoSansKRRegular',
                  color: AppColors.grey,
                  fontSize: 14,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 3, horizontal: 16),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: SizedBox(
              height: 48,
              width: screenWidth * 0.802,
              child: TextField(
                cursorColor: AppColors.grey,
                decoration: InputDecoration(
                  fillColor: AppColors.fillGrey,
                  filled: true,
                  hintText: '비밀번호',
                  hintStyle: TextStyle(
                    fontFamily: 'NotoSansKRRegular',
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 3, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          // 클릭 시 색상 제거
          splashFactory: NoSplash.splashFactory,
        ),
        child: Text(
          '비밀번호 찾기',
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'NotoSansKRMedium',
            color: AppColors.blue,
          ),
        ),
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
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'NotoSansKRSemiBold',
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ),
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
                    style: TextStyle(
                      color: Color(0xff494949),
                      fontSize: 15,
                      fontFamily: 'NotoSansKRSemiBold',
                    ), // 텍스트 스타일
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
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 13,
              fontFamily: 'NotoSansKRSemiBold',
            ),
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
}
