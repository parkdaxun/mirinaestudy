import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mirinaestudy/screen/login/parents_login_screen.dart';
import '../colors.dart';
import 'login/students_login_screen.dart';
import 'login/teachers_login_screen.dart';

class AccountSelectScreen extends StatefulWidget {
  _AccountSelectScreenState createState() => _AccountSelectScreenState();
}

class _AccountSelectScreenState extends State<AccountSelectScreen> {
  String _accountType = ''; // 그룹 이름 저장

  void _onButtonPressed(String accountType, BuildContext context) {
    setState(() {
      _accountType = accountType;
      print(_accountType);
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen(accountType: _accountType),),
    );
  }

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
            SvgPicture.asset(
              'assets/images/mirinaestudy_logo.svg',
              width: screenWidth * 0.561,
              height: screenHeight * 0.1457,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                '해당 그룹을 선택 하세요.',
                style: TextStyle(fontFamily: "NotoSansKRSemiBold", fontSize: 16),
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
                          fontFamily: 'NotoSansKRMedium',
                          color: AppColors.blue,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '로 로그인하겠습니다',
                        style: TextStyle(
                          fontFamily: 'NotoSansKRMedium',
                          color: Colors.black,
                          fontSize: 14,
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
                style: TextStyle(fontFamily: 'NotoSansKRSemiBold', color: Colors.white, fontSize: 15),
              ),
              onPressed: () => _onButtonPressed('선생님', context),
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
                  style: TextStyle(fontFamily: 'NotoSansKRSemiBold', color: Colors.white, fontSize: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StudentsLoginScreen()),
                  );
                },
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
                  style: TextStyle(fontFamily: 'NotoSansKRSemiBold', color: Colors.white, fontSize: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ParentsLoginScreen()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
