import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mirinaestudy/screen/account_select_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToAccountSelectScreen();
  }

  _navigateToAccountSelectScreen() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Get.to(() => AccountSelectScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3BA2F9),
      body: Center(
        child: SvgPicture.asset('assets/images/mirinaestudy_white_logo.svg'),
      ),
    );
  }
}

