import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/app_bar.dart';

class MypageScreen extends StatefulWidget {
  _MypageScreenState createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: '마이페이지'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text('마이페이지'),
              ),
            )
          ],
        ),
      ),
    );
  }
}