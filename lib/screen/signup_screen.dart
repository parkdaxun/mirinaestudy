import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinaestudy/widget/social_login_buttons.dart';

import '../colors.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: AppColors.grey,
        ),
        shape: Border(
          bottom: BorderSide(
            color: AppColors.grey,
            width: 1,
          ),
        ),
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
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                '선생님 회원가입',
                style: TextStyle(fontFamily: "NunitoBold", fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: _textFields(context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
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
                    '회원가입',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen(),),
                    );
                  },
                ),
              ),
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
                hintText: '이름',
                hintStyle: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 16),
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
                  hintText: '이메일',
                  hintStyle: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 16),
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
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 16),
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
                  hintText: '비밀번호 재확인',
                  hintStyle: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 16),
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
}