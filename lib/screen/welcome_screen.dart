import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class WelcomeScreen extends StatefulWidget {
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('환경합니다!', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.blue, fontSize: 45),),
            Padding(
              padding: const EdgeInsets.only(top: 9),
              child: Text('회원가입이 완료 되었습니다.', style: TextStyle(color: AppColors.blue, fontSize: 17),),
            ),
          ],
        ),
      ),
    );
  }
}