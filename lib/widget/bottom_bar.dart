import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../screen/class_screen.dart';
import '../screen/home_screen.dart';
import '../screen/homework_screen.dart';
import '../screen/mypage_screen.dart';

class BottomBar extends StatefulWidget {
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(),
          ClassScreen(),
          HomeworkScreen(),
          MypageScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 95,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xff3A1F65).withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10.8,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            unselectedLabelStyle: TextStyle(fontSize: 11),
            selectedLabelStyle: TextStyle(fontSize: 11),
            unselectedItemColor: AppColors.grey,
            selectedItemColor: AppColors.blue,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: '홈',
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/icons/home_icon.png'),
                    SizedBox(height: 6), // 아이콘과 라벨 사이 간격
                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/icons/home_active_icon.png'),
                    SizedBox(height: 6), // 아이콘과 라벨 사이 간격
                  ],
                ),
              ),
              BottomNavigationBarItem(
                label: '수업',
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/icons/class_icon.png'),
                    SizedBox(height: 6), // 아이콘과 라벨 사이 간격
                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/icons/class_active_icon.png'),
                    SizedBox(height: 6), // 아이콘과 라벨 사이 간격
                  ],
                ),
              ),
              BottomNavigationBarItem(
                label: '과제',
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/icons/homework_icon.png'),
                    SizedBox(height: 6), // 아이콘과 라벨 사이 간격
                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/icons/homework_active_icon.png'),
                    SizedBox(height: 6), // 아이콘과 라벨 사이 간격
                  ],
                ),
              ),
              BottomNavigationBarItem(
                label: '마이페이지',
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/icons/mypage_icon.png'),
                    SizedBox(height: 6), // 아이콘과 라벨 사이 간격
                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/icons/mypage_active_icon.png'),
                    SizedBox(height: 6), // 아이콘과 라벨 사이 간격
                  ],
                ),
              ),
            ],
            enableFeedback: false,
          ),
        ),
      ),
    );
  }
}
