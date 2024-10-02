import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinaestudy/screen/payment_screen.dart';

import '../colors.dart';
import '../screen/class_screen.dart';
import '../screen/homework/homework_screen.dart';
import '../screen/report_screen.dart';

class HomeMenuWidget extends StatelessWidget {
  final String title;
  final String iconName;
  final String screenName;

  const HomeMenuWidget({
    Key? key,
    required this.title,
    required this.iconName,
    required this.screenName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => _getScreen(screenName)),
        );
      },
      child: Container(
        width: screenWidth * 0.2,
        height: screenHeight * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xff898989).withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 9.2,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icons/$iconName.png'),
            Text(
              '$title',
              style: TextStyle(
                  fontFamily: 'NotoSansKRMedium',
                  fontSize: 12,
                  color: AppColors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getScreen(String screenName) {
    switch (screenName) {
      case 'ClassScreen' :
        return ClassScreen();
      case 'HomeworkScreen' :
        return HomeworkScreen();
      case 'ReportScreen' :
        return ReportScreen();
      case 'PaymentScreen' :
        return PaymentScreen();
      case 'ClassScreen' :
        return ClassScreen();
      default:
        return Container();
    }
  }
}
