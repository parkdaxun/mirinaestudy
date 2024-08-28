import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  late final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset(
              'assets/images/icons/menu_icon.png',
              width: 22,
              height: 22,
            ),
          ),
        ),
      ],
      title: Text(
        '${title}',
        style: TextStyle(
          color: AppColors.grey,
          fontSize: 16,
        ),
      ),
      centerTitle: true,
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
