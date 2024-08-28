import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  late final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        '${title}',
        style: TextStyle(
          color: AppColors.grey,
          fontSize: 16,
        ),
      ),
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
