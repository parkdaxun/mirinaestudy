import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: Border(
          bottom: BorderSide(
            color: AppColors.grey,
            width: 1,
          ),
        ),
        iconTheme: IconThemeData(
          color: AppColors.grey,
        ),
        title: Text(
          '홈',
          style: TextStyle(color: AppColors.grey, fontSize: 16),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text('홈'),
              ),
            )
          ],
        ),
      ),
    );
  }
}