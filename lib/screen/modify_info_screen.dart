import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinaestudy/widget/app_bar.dart';

import '../colors.dart';

class ModifyInfoScreen extends StatefulWidget {
  _ModifyInfoScreenState createState() => _ModifyInfoScreenState();
}

class _ModifyInfoScreenState extends State<ModifyInfoScreen> {
  static InputDecoration textFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 16),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.grey, width: 1.0),
      borderRadius: BorderRadius.circular(10),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.grey, width: 1.0),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.grey, width: 1.0),
      borderRadius: BorderRadius.circular(10),
    ),
  );


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: '정보 수정'),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: screenHeight*0.04),
                child: Text('회원 계정정보', style: TextStyle(fontSize: 16),),
              ),
              _textFields(),
            ],
          ),
        )
      ),
    );
  }

  Widget _textFields() {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 48,
            width: screenWidth * 0.84,
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: '이름',
                hintStyle: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}