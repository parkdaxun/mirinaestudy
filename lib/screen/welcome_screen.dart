import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../colors.dart';

class WelcomeScreen extends StatefulWidget {
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double welcomeTextWidth = screenWidth * 0.52;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(right: (screenWidth - welcomeTextWidth) / 2),
              child: SizedBox(height: 42, child: SvgPicture.asset('assets/images/welcomescreen_pic.svg')),
            ),
            Center(
              child: Text(
                '환영합니다!',
                style: TextStyle(
                    fontFamily: 'NotoSansKRBold',
                    color: AppColors.blue,
                    fontSize: 45),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Center(
                child: Text(
                  '회원가입이 완료 되었습니다.',
                  style: TextStyle(
                    fontFamily: 'NotoSansKRMedium',
                    color: AppColors.blue,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
