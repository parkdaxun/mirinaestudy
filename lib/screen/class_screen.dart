import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import '../colors.dart';

class ClassScreen extends StatefulWidget {
  _ClassScreenState createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fillGrey,
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
          '수업',
          style: TextStyle(color: AppColors.grey, fontSize: 16),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text('수업'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
