import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10.8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: TabBar(
          labelColor: AppColors.purple,
          unselectedLabelColor: AppColors.grey,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.home,
                size: 20,
              ),
              child: Text(
                '홈',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Tab(
                icon: Icon(
                  Icons.person,
                  size: 20,
                ),
                child: Text(
                  '마이페이지',
                  style: TextStyle(fontSize: 12),
                )
            )
          ],
        ),
      ),
    );
  }
}