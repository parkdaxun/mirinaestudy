import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../colors.dart';
import '../widget/alarm_list_widget.dart';

class AlarmScreen extends StatefulWidget {
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AlarmScreenAppBar(),
      body: Center(
        child: Column(
          children: [
            filterWidget(),
            AlarmListWidget(),
          ],
        ),
      ),
    );
  }

  Widget filterWidget() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight * 0.05,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 19, right: 27),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '전체',
              style: TextStyle(color: AppColors.blue, fontSize: 14),
            ),
            SvgPicture.asset('assets/images/icons/dropdown_icon.svg'),
          ],
        ),
      ),
    );
  }
}

class AlarmScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff371E56).withOpacity(0.05),
            blurRadius: 9,
            spreadRadius: -3,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          '알림',
          style: TextStyle(
              color: AppColors.grey,
              fontSize: 15,
              fontFamily: 'NotoSansKRMedium'),
        ),
        shape: Border(
          bottom: BorderSide(
            color: Color(0xffE2E2E2),
            width: 0.4,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.grey,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Image.asset('assets/images/icons/delete_icon.png'),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
