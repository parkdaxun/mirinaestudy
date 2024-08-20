import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class AccountSelectScreen extends StatefulWidget {
  _AccountSelectScreenState createState() => _AccountSelectScreenState();
}

class _AccountSelectScreenState extends State<AccountSelectScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
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
                '해당 그룹을 선택 하세요.',
                style: TextStyle(fontFamily: "NunitoBold", fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: _buttonList(),
            ),
            Padding(
              padding: const EdgeInsets.only(top:26),
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {},
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '관리자',
                        style: TextStyle(
                          color: AppColors.blue,
                        ),
                      ),
                      TextSpan(
                        text: '로 로그인하겠습니다',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonList() {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 313,
            height: 48,
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
                '선생님',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: SizedBox(
              width: 313,
              height: 48,
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
                  '학생',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onPressed: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: SizedBox(
              width: 313,
              height: 48,
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
                  '학부모',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
