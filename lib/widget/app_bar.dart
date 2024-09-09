import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  late final String title;
  final bool showIcons;

  CustomAppBar({required this.title, this.showIcons = true});

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
        actions: showIcons ? _buildActions() : [],
        title: Text(
          '${title}',
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 15,
            fontFamily: 'NotoSansKRMedium'
          ),
        ),
        shape: Border(
          bottom: BorderSide(
            color: Color(0xffE2E2E2),
            width: 0.4,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: AppColors.grey,
        ),
      ),
    );
  }

  List <Widget> _buildActions() {
    return [
      GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 7, 8),
          child: Image.asset(
            'assets/images/icons/bell_icon.png',
            width: 22,
            height: 22,
          ),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.fromLTRB(7, 8, 20, 8),
          child: Image.asset(
            'assets/images/icons/menu_icon.png',
            width: 22,
            height: 22,
          ),
        ),
      ),
    ];
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
